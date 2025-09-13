import 'package:flutter/material.dart';
import 'package:Medikalam/src/core/utils/helpers/console_log_capture.dart';
import 'package:Medikalam/src/core/utils/helpers/log_upload_service.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/core/utils/helpers/medikalam_backend_test.dart';

/// Widget for testing log capture and upload functionality
class LogTestWidget extends StatefulWidget {
  const LogTestWidget({super.key});

  @override
  State<LogTestWidget> createState() => _LogTestWidgetState();
}

class _LogTestWidgetState extends State<LogTestWidget> {
  final ConsoleLogCapture _logCapture = ConsoleLogCapture();
  final LogUploadService _uploadService = LogUploadService();

  List<String> _capturedLogs = [];
  bool _isCapturing = false;
  String _status = 'Ready';

  @override
  void initState() {
    super.initState();
    _initializeLogCapture();
  }

  Future<void> _initializeLogCapture() async {
    await _logCapture.initialize();
    setState(() {
      _isCapturing = true;
      _status = 'Log capture initialized';
    });
  }

  void _testLogGeneration() {
    // Generate various types of logs
    logger.i('Test info log message');
    logger.d('Test debug log message');
    logger.w('Test warning log message');
    logger.e('Test error log message');

    debugPrint('Test debug print message');
    print('Test print statement');

    setState(() {
      _capturedLogs = _logCapture.getAllLogs();
      _status = 'Generated test logs';
    });
  }

  Future<void> _uploadLogs() async {
    setState(() {
      _status = 'Uploading logs...';
    });

    try {
      await _logCapture.forceUpload();

      // Test direct upload service
      final testLogData = {
        'timestamp': DateTime.now().toIso8601String(),
        'platform': 'test',
        'logs': _capturedLogs,
        'test': true,
      };

      final result = await _uploadService.uploadLogs(logData: testLogData);

      result.when(
        success: (success) {
          setState(() {
            _status = 'Logs uploaded successfully!';
          });
        },
        failure: (failure) {
          setState(() {
            _status = 'Upload failed: ${failure.toString()}';
          });
        },
      );
    } catch (e) {
      setState(() {
        _status = 'Upload error: $e';
      });
    }
  }

  Future<void> _testConnection() async {
    setState(() {
      _status = 'Testing Medikalam backend connection...';
    });

    final result = await _uploadService.testConnection();

    result.when(
      success: (success) {
        setState(() {
          _status = 'Medikalam backend connection successful!';
        });
      },
      failure: (failure) {
        setState(() {
          _status =
              'Medikalam backend connection failed: ${failure.toString()}';
        });
      },
    );
  }

  Future<void> _testBackendAPIs() async {
    setState(() {
      _status = 'Testing Medikalam backend APIs...';
    });

    try {
      await MedikalamBackendTest.runAllTests();
      setState(() {
        _status =
            'Medikalam backend API tests completed! Check logs for details.';
      });
    } catch (e) {
      setState(() {
        _status = 'Backend API tests failed: $e';
      });
    }
  }

  Future<void> _testLogUpload() async {
    setState(() {
      _status = 'Testing log upload...';
    });

    try {
      await _logCapture.testUpload();
      setState(() {
        _status = 'Test log upload completed! Check your backend.';
      });
    } catch (e) {
      setState(() {
        _status = 'Test log upload failed: $e';
      });
    }
  }

  Future<void> _testLogUploadAlternative() async {
    setState(() {
      _status = 'Testing alternative log upload format...';
    });

    try {
      await _logCapture.testUploadAlternative();
      setState(() {
        _status = 'Alternative test log upload completed! Check your backend.';
      });
    } catch (e) {
      setState(() {
        _status = 'Alternative test log upload failed: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Test Widget'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status: $_status',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Captured Logs: ${_capturedLogs.length}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Is Capturing: $_isCapturing',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _testLogGeneration,
              child: const Text('Generate Test Logs'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _uploadLogs,
              child: const Text('Upload Logs to Medikalam Backend'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _testConnection,
              child: const Text('Test Medikalam Backend Connection'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _testBackendAPIs,
              child: const Text('Test Medikalam Backend APIs'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _testLogUpload,
              child: const Text('Test Log Upload'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _testLogUploadAlternative,
              child: const Text('Test Alternative Format'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Captured Logs:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _capturedLogs.length,
                        itemBuilder: (context, index) {
                          final log = _capturedLogs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 2.0,
                            ),
                            child: Text(
                              log,
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'monospace',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _logCapture.dispose();
    super.dispose();
  }
}
