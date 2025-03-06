import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class FLTextFieldInput extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPasswordField;

  const FLTextFieldInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.isPasswordField = false,
  });

  @override
  State<FLTextFieldInput> createState() => _FLTextFieldInputState();
}

class _FLTextFieldInputState extends State<FLTextFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(208, 208, 208, 0.3),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: widget.controller,
              obscureText: widget.isPasswordField,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: widget.labelText,
                labelStyle: FLTextStyles.inputLabel,
                hintText: widget.hintText,
                hintStyle: FLTextStyles.inputHint,
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
