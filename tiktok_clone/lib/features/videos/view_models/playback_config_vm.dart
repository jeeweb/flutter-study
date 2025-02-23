import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/playback_config_model.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  final PlaybackConfigRepository _repository;

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    // repository에서 값을 디스크에 persist하게 저장
    _repository.setMuted(value);

    // state를 이용하여 내부 데이터 접근할때는 state.muted = value;로 접근 가능

    // state가 바뀔 때 기존 state를 새 state로 대체하기 -> state가 바뀔 때 화면들이 새로고침 됨
    state = PlaybackConfigModel(
      muted: value,
      autoplay: state.autoplay,
    );
  }
  // 사용자가 setMuted를 호출하면

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModel(
      muted: state.muted,
      autoplay: value,
    );
  }

  @override
  PlaybackConfigModel build() {
    // build 메서드에서 state의 초기 데이터 반환 -> Notifier 안에서 state (데이터)에 접근할 수 있고 수정도 가능
    return PlaybackConfigModel(
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    );
  }
}

// Provider 만들기
final PlaybackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(() =>
        throw UnimplementedError()); // sharedPreferences에 접근하기 위해 일부러 error 발생
// NotifierProvider<expose하고 싶은 Provider, Provider가 expose할 데이터>(ViewModel을 만들 함수)
