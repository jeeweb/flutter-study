import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class FLTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isPasswordField;
  final String? Function(String?) validator;
  final Function(String?)? onSaved;

  const FLTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.isPasswordField = false,
    required this.validator,
    this.onSaved,
  });

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
            TextFormField(
              obscureText: isPasswordField,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: labelText,
                labelStyle: FLTextStyles.inputLabel,
                hintText: hintText,
                hintStyle: FLTextStyles.inputHint,
                border: InputBorder.none,
              ),
              validator: validator,
              onSaved: onSaved,
            ),
          ],
        ),
      ),
    );
  }
}
