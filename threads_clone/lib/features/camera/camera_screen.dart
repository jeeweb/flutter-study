import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _hasPermission = false;
  bool _isSelfieMode = false;
  bool _isFlashMode = false;
  late CameraController _cameraController;
  late FlashMode _flashMode;

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

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  void _toggleFlashMode() {
    _isFlashMode = !_isFlashMode;
    // if (_isFlashMode) {
    //   _setFlashMode(FlashMode.always);
    // } else {
    //   _setFlashMode(FlashMode.off);
    // }
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

  Future<void> _onPickImagePressed() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return; // 유저가 아무것도 선택하지 않았을 때

    //Navigator.of(context).pop();
    Navigator.of(context).pop(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
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
                        bottom: 16.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: _toggleFlashMode,
                                  icon: Icon(
                                    _isFlashMode
                                        ? Icons.flash_on_rounded
                                        : Icons.flash_off_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
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
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: _toggleSelfieMode,
                                  color: Colors.white,
                                  icon: Icon(
                                    Icons.cameraswitch,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          ),
          SizedBox(height: 36.0),
          Row(
            children: [
              Spacer(),
              Text(
                "Camera",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: _onPickImagePressed,
                    child: Text(
                      "Library",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
