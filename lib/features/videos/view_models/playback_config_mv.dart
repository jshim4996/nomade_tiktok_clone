import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/model/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/video_playback_config_repo.dart';

class PlaybakConfigViewModel extends ChangeNotifier {
  final VideoPlaybackConfigReposigory _reposigory;

  late final PlaybackConfigModel _model = PlaybackConfigModel(
      muted: _reposigory.isMuted(), autoplay: _reposigory.isAutoPlay());

  PlaybakConfigViewModel(this._reposigory);

  bool get muted => _model.muted;

  bool get autoplay => _model.autoplay;

  void setMuted(bool value) {
    _reposigory.setMuted(value);
    _model.muted = value;
    notifyListeners();
  }

  void setAutoplay(bool value) {
    _reposigory.setAutoplay(value);
    _model.autoplay = value;
    notifyListeners();
  }
}
