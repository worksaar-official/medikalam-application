// Dart imports:
import 'dart:io';
import 'dart:typed_data';

// Package imports:
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/helpers/logger.dart';

class CacheUtils {
  static late SharedPreferences _prefs;
  static const String _cacheFolderName = "canvas_cache";

  static void setPrefs(SharedPreferences pref) {
    _prefs = pref;
  }

  /// Saves a value to the cache with a given ttl in hours.
  ///
  /// The ttl is the time to live in hours. After this time, the value
  /// is removed from the cache.
  ///
  /// The actual ttl that is used is the minimum of the given ttl and
  /// the time until the app is restarted. If the app is restarted before
  /// the ttl is reached, the value is removed from the cache.
  ///
  /// The value is stored in SharedPreferences and the ttl is stored
  /// as a separate entry in SharedPreferences with the same key but
  /// with "_exp" appended to it. The value of this entry is the
  /// milliseconds since epoch when the value should be removed from
  /// the cache.
  static Future<void> cache(String key, String value, int ttl) async {
    await _prefs.setString(key, value);
    await _prefs.setInt('${key}_exp',
        DateTime.now().millisecondsSinceEpoch + ttl * 60 * 60 * 1000);
    logger.i("Cached: $key : $value : $ttl");
  }

  static Future<String?> getCached(String key) async {
    final expiryTime = _prefs.getInt('${key}_exp') ?? 0;

    if (expiryTime > DateTime.now().millisecondsSinceEpoch) {
      return _prefs.getString(key);
    } else {
      await _prefs.remove(key);
      await _prefs.remove('${key}_exp');
      return null;
    }
  }

  // Save bitmap to local storage
  static Future<void> saveCanvasBitmap(Uint8List bitmap, int pageNumber) async {
    if (bitmap.isEmpty) return;

    final cacheFolder = await _getOrCreateCacheFolder();
    final fileName = _generateFileName(pageNumber);
    final file = File('${cacheFolder.path}/$fileName');

    await file.writeAsBytes(bitmap);
  }

  // Load bitmap from local storage
  static Future<Uint8List?> loadCanvasBitmapFromStorage(int pageNumber) async {
    final cacheFolder = await _getCacheFolder();
    final fileName = _generateFileName(pageNumber);
    final file = File('${cacheFolder.path}/$fileName');

    if (await file.exists()) {
      return await file.readAsBytes();
    }
    return null;
  }

  // Clear cache
  static Future<void> clearCache() async {
    final cacheFolder = await _getCacheFolder();

    if (await cacheFolder.exists()) {
      final files = cacheFolder.listSync();
      for (var file in files) {
        await file.delete();
      }
    }

    await _prefs.clear();
  }

  // Get or create cache folder
  static Future<Directory> _getOrCreateCacheFolder() async {
    final directory = await getApplicationDocumentsDirectory();
    final cacheFolder = Directory('${directory.path}/$_cacheFolderName');

    if (!await cacheFolder.exists()) {
      await cacheFolder.create(recursive: true);
    }

    return cacheFolder;
  }

  // Get cache folder
  static Future<Directory> _getCacheFolder() async {
    final directory = await getApplicationDocumentsDirectory();
    return Directory('${directory.path}/$_cacheFolderName');
  }

  // Generate file name
  static String _generateFileName(int pageNumber) {
    return 'page_${pageNumber}_cache.png';
  }
}
