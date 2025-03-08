import 'package:flutter/material.dart';
import 'package:feel_log/features/authentication/views/widgets/primary_button.dart';
import 'package:feel_log/features/authentication/views/widgets/text_field_input.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../core/core.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  double _sliderValue = 0.0;

  IconData getIcon() {
    if (_sliderValue < 1) {
      return MdiIcons.circle;
    } else if (_sliderValue < 2) {
      return MdiIcons.square;
    } else if (_sliderValue < 3) {
      return MdiIcons.hexagon;
    } else if (_sliderValue < 4) {
      return MdiIcons.octagram;
    } else {
      return MdiIcons.decagram;
    }
  }

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
                        getIcon(),
                        size: 72.0,
                      ),
                      Slider(
                        value: _sliderValue,
                        min: 0,
                        max: 5,
                        divisions: 4,
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
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
                        maxLines: 6,
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
