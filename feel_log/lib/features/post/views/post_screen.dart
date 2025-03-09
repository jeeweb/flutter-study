import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:feel_log/router/router_constants.dart';
import 'package:feel_log/features/common/widgets/primary_button.dart';
import 'package:feel_log/features/common/widgets/text_field_input.dart';
import 'package:feel_log/features/common/widgets/datepicker_field_input.dart';
import 'package:feel_log/features/post/view_model/post_view_model.dart';
import '../../../core/core.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FLDatePickerFieldState> _datePickerKey = GlobalKey();

  Map<String, dynamic> formData = {};

  double _sliderValue = 1;

  String? _isTitleValid(value) {
    if (value.isEmpty) return "Please write the title.";
    return null;
  }

  String? _isContentValid(value) {
    if (value.isEmpty) return "Please write your feeling.";
    return null;
  }

  void _onPostTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        try {
          ref.read(postProvider.notifier).postLog(
              _sliderValue,
              formData["postTitle"],
              formData["postContent"],
              formData["createdAt"],
              DateTime.timestamp());

          print("✅ 데이터가 Firestore에 저장됨!");

          // 성공적으로 저장되면 입력값 초기화
          _datePickerKey.currentState?.resetDate();

          setState(() {
            _sliderValue = 1;
            formData.clear();
            _formKey.currentState!.reset();
          });

          Future.delayed(Duration(milliseconds: 200), () {
            context.pushReplacement(RouteURL.home);
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Post saved successfully!")),
          );
        } catch (e) {
          print("❌ Firestore 저장 오류: $e");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to save post.")),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 56.0,
                    height: 92.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment(-1.0, 1.0),
                    padding: EdgeInsets.only(
                      left: 48.0,
                      right: 16.0,
                      bottom: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF010101),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(56.0),
                      ),
                    ),
                    child: Text(
                      "Record your log.",
                      style: FLTextStyles.headlineWH,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              width: size.width - 20.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(56.0),
                  bottomLeft: Radius.circular(56.0),
                  bottomRight: Radius.circular(56.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 36.0,
                  horizontal: 48.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Icon(
                        getMoodIcon(_sliderValue),
                        size: 72.0,
                      ),
                      Slider(
                        value: _sliderValue,
                        min: 1,
                        max: 5,
                        divisions: 4,
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                      SizedBox(height: 12.0),
                      FLDatePickerField(
                        key: _datePickerKey,
                        onSaved: (value) => {
                          formData["createdAt"] = DateTime.tryParse(value ?? "")
                        },
                      ),
                      FLTextFormField(
                        labelText: "Title",
                        hintText: "Write the title.",
                        validator: (value) => _isTitleValid(value),
                        onSaved: (value) => {
                          if (value != null) {formData["postTitle"] = value}
                        },
                      ),
                      FLTextFormField(
                        labelText: "Comment",
                        hintText:
                            "Express your feelings in up to 200 characters.",
                        //maxLines: 6,
                        maxLines: 2,
                        maxLength: 200,
                        validator: (value) => _isContentValid(value),
                        onSaved: (value) => {
                          if (value != null) {formData["postContent"] = value}
                        },
                      ),
                      SizedBox(height: 16.0),
                      FLPrimaryButton(
                        buttonText: "Post",
                        onTap: _onPostTap,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
