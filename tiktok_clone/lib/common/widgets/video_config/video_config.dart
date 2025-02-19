import 'package:flutter/material.dart';

class VideoConfigData extends InheritedWidget {
  final bool autoMute;
  final void Function() toggleMuted;
  const VideoConfigData({
    super.key,
    required this.autoMute,
    required this.toggleMuted,
    required super.child,
  });

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
  }

  @override
  // 위젯을 rebuild 할지 말지 정함
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // 이 위젯을 다시 render하면 oldWidget의 state를 가지게 되고 이걸 선택할 수 있음
    // VideoConfig 위젯을 상속하는 위젯들에게 변경된 걸 알려줄 수 있음
    return true;
  }
}

class VideoConfig extends StatefulWidget {
  final Widget child;

  const VideoConfig({super.key, required this.child});

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
  bool autoMute = false;
  void toggleMuted() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
      toggleMuted: toggleMuted,
      autoMute: autoMute,
      child: widget.child,
    );
  }
}
