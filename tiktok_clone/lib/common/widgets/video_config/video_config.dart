import 'package:flutter/material.dart';

final videoConfig = ValueNotifier(false);

/* ChangeNotifier 사용
class VideoConfig extends ChangeNotifier {
  bool autoMute = true;

  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners(); // autoMute 값을 듣는 화면에 데이터 변화를 알게 해줌
  }
}

final videoConfig = VideoConfig();
*/
