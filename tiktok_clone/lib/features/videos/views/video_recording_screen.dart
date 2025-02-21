import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/views/widgets/video_preview_screen.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 200),
  );

  late FlashMode _flashMode;
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    initPermissions();
    WidgetsBinding.instance.addObserver(this);
    _progressAnimationController.addListener(() {
      // listener는 value가 바뀐걸 알려줌
      setState(() {});
    });
    _progressAnimationController.addStatusListener((status) {
      // StatusListener는 애니메이션이 끝난걸 알려줌
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    _buttonAnimationController.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.3).animate(_buttonAnimationController);

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    // print(cameras); // 사용 가능한 카메라 리스트로 몇개의 카메라가 있는지 확인가능

    // camera가 없는 경우 체크
    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
    );

    await _cameraController.initialize();

    await _cameraController.prepareForVideoRecording();

    _flashMode = _cameraController.value.flashMode;

    setState(() {});
  }

  // 카메라와 마이크 요청
  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      // 우리에게 권한이 있다는 걸 의미
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _startRecording(TapDownDetails _) async {
    if (_cameraController.value.isRecordingVideo) return;

    await _cameraController.startVideoRecording();

    _buttonAnimationController.forward();
    _progressAnimationController.forward();
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) return;

    _buttonAnimationController.reverse();
    _progressAnimationController.reset();

    final video = await _cameraController.stopVideoRecording();

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(video: video, isPicked: false),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state); // 앱을 나갔을 때의 상태를 알 수 있음
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized)
      return; // 카메라가 initialized 되었을 때만 dispose 되어야 하므로
    if (state == AppLifecycleState.paused) {
      // 유저가 나갔을 때
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // 다시 돌아왔을 때
      initCamera();
    }
  }

  Future<void> _onPickVideoPressed() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video == null) return; // 유저가 아무것도 선택하지 않았을 때

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          video: video,
          isPicked: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Requesting permissions...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size20,
                      )),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    top: Sizes.size40,
                    left: Sizes.size20,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: _toggleSelfieMode,
                          color: Colors.white,
                          icon: Icon(
                            Icons.cameraswitch,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => _setFlashMode(FlashMode.off),
                          color: _flashMode == FlashMode.off
                              ? Colors.amber.shade200
                              : Colors.white,
                          icon: Icon(
                            Icons.flash_off_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => _setFlashMode(FlashMode.always),
                          color: _flashMode == FlashMode.always
                              ? Colors.amber.shade200
                              : Colors.white,
                          icon: Icon(
                            Icons.flash_on_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => _setFlashMode(FlashMode.auto),
                          color: _flashMode == FlashMode.auto
                              ? Colors.amber.shade200
                              : Colors.white,
                          icon: Icon(
                            Icons.flash_auto_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          onPressed: () => _setFlashMode(FlashMode.torch),
                          color: _flashMode == FlashMode.torch
                              ? Colors.amber.shade200
                              : Colors.white,
                          icon: Icon(
                            Icons.flashlight_on_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size14,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTapDown: _startRecording,
                          onTapUp: (details) => _stopRecording(),
                          child: ScaleTransition(
                            scale: _buttonAnimation,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: Sizes.size80 + Sizes.size14,
                                  height: Sizes.size80 + Sizes.size14,
                                  child: CircularProgressIndicator(
                                    color: Colors.red.shade400,
                                    strokeWidth: Sizes.size6,
                                    value: _progressAnimationController.value,
                                  ),
                                ),
                                Container(
                                  width: Sizes.size80,
                                  height: Sizes.size80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: _onPickVideoPressed,
                              icon: FaIcon(
                                FontAwesomeIcons.image,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
