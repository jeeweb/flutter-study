import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageTakingScreen extends StatefulWidget {
  const ImageTakingScreen({super.key});

  @override
  State<ImageTakingScreen> createState() => _ImageTakingScreenState();
}

class _ImageTakingScreenState extends State<ImageTakingScreen> {
  bool _hasPermission = false;
  bool _isSelfieMode = false;
  late CameraController _cameraController;

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
  }

  // 카메라와 마이크 요청
  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    if (!cameraDenied) {
      // 우리에게 권한이 있다는 걸 의미
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _takePicture() async {
    final image = await _cameraController.takePicture();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
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
                        fontSize: 24.0,
                      )),
                  SizedBox(height: 20.0),
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    top: 40.0,
                    left: 20.0,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: _toggleSelfieMode,
                          color: Colors.white,
                          icon: Icon(
                            Icons.cameraswitch,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    child: GestureDetector(
                      onTap: _takePicture,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 88.0,
                            height: 88.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 72.0,
                            height: 72.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
