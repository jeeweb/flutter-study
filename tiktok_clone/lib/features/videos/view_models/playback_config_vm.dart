import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  final PlaybackConfigRepository _repository;

  late final PlaybackConfigModel _model = PlaybackConfigModel(
    muted: _repository.isMuted(),
    autoplay: _repository.isAutoplay(),
  );

  PlaybackConfigViewModel(this._repository);

  // repository와 model 직접 공개하지 않기 위함
  bool get muted => _model.muted;
  bool get autoplay => _model.autoplay;

  void setMuted(bool value) {
    // repository에서 값을 디스크에 persist하게 저장
    _repository.setMuted(value);

    // Model 수정
    _model.muted = value;

    // listen 하고 있는 모두에게 notify
    notifyListeners();
  }

  void setAutoplay(bool value) {
    // repository에서 값을 디스크에 persist하게 저장
    _repository.setAutoplay(value);

    // Model 수정
    _model.autoplay = value;

    // listen 하고 있는 모두에게 notify
    notifyListeners();
  }
}
