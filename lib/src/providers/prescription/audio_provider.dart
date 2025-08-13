// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class AudioProvider with ChangeNotifier {
  AudioProvider() {
    _initialiseControllers();
    _getDir();

    playerController.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.stopped) {
        notifyListeners();
      }
    });
  }
  // Controllers
  late final RecorderController recorderController;
  late final PlayerController playerController;

  // Variables
  String? path;
  bool isRecording = false;
  bool isRecordingCompleted = false;
  bool isLoading = true;
  late Directory appDirectory;


  void _initialiseControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
    playerController = PlayerController();
  }

  void _getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    path = "${appDirectory.path}/recording.m4a";
    isLoading = false;
    notifyListeners();
  }


  @override
  void dispose() {
    recorderController.dispose();
    playerController.dispose();
    recorderController.reset();
    super.dispose();
  }

  void playOrPause() async {
    if (path == null || path!.isEmpty || isRecording) return;

    try {
      print("=========Playing path======= $path");
      if (playerController.playerState.isPlaying) {
        await playerController.pausePlayer();
      } else {
        // Ensure it's clean before starting
        await playerController.stopPlayer();
        await playerController.preparePlayer(path: path!);
        await playerController.startPlayer();
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Playback error: $e');
    }
  }

  void startOrStopRecording() async {
    try {
      if (isRecording) {
        recorderController.reset();

        path = await recorderController.stop(false);

        if (path != null) {
          isRecordingCompleted = true;
          debugPrint("Recorded path $path");
          debugPrint("Recorded file size: ${File(path!).lengthSync()}");
        }
      } else {
        await recorderController.record(path: path); // Path is optional
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (recorderController.hasPermission) {
        isRecording = !isRecording;
        notifyListeners();
      }
    }
  }
}
