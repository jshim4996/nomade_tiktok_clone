import 'package:shared_preferences/shared_preferences.dart';

class VideoPlaybackConfigReposigory {
  static const String _autoplay = 'autoplay';
  static const String _muted = 'muted';

  final SharedPreferences _preferences;

  VideoPlaybackConfigReposigory(this._preferences);

  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  bool isMuted() {
    return _preferences.getBool(_muted) ?? false;
  }

  bool isAutoPlay() {
    return _preferences.getBool(_autoplay) ?? false;
  }
}
