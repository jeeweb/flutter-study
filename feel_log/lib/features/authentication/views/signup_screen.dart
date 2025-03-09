import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:feel_log/router/router_constants.dart';
import 'package:feel_log/features/authentication/view_models/signup_view_model.dart';
import 'package:feel_log/features/common/widgets/text_field_input.dart';
import 'package:feel_log/features/common/widgets/primary_button.dart';
import '../../../core/core.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  String _password = "";

  String? _isUsernameValid(value) {
    if (value.isEmpty) return "Please write your username.";
    return null;
  }

  String? _isEmailValid(value) {
    if (value.isEmpty) return "Please write your email.";
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(value)) {
      return "Email is not valid";
    }
    return null;
  }

  String? _isPasswordValid(value) {
    if (value.isEmpty) return "Please write your password.";
    if (value.isNotEmpty && value.length < 8) {
      return "Password should be more than 8 characters.";
    }
    _password = value;
    return null;
  }

  String? _isPasswordConfirm(value) {
    if (value.isEmpty) return "Please confirm your password.";
    if (_password != value) {
      return "It is different with the password.";
    }
    return null;
  }

  void _onLoginTap() {
    Navigator.pop(context);
  }

  void _onSignUpTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        ref.read(signUpForm.notifier).state = {
          "username": formData["username"],
          "email": formData["email"],
          "password": formData["password"]
        };
        ref.read(signUpProvider.notifier).signUp(context);
        context.goNamed(RouteNames.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _onLoginTap,
                      child: Icon(
                        MdiIcons.chevronLeft,
                        size: 36.0,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: FLTextStyles.headlineWH,
                        ),
                      ),
                    ),
                    SizedBox(width: 36.0),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64.0),
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
                      FLTextFormField(
                        labelText: "Username",
                        hintText: "Make your Username.",
                        validator: (value) => _isUsernameValid(value),
                        onSaved: (value) => {
                          if (value != null) {formData["username"] = value}
                        },
                      ),
                      FLTextFormField(
                        labelText: "Email",
                        hintText: "Write your Email Address.",
                        validator: (value) => _isEmailValid(value),
                        onSaved: (value) => {
                          if (value != null) {formData["email"] = value}
                        },
                      ),
                      FLTextFormField(
                        labelText: "Password",
                        hintText: "More than 8 characters.",
                        isPasswordField: true,
                        validator: (value) => _isPasswordValid(value),
                        onSaved: (value) => {
                          if (value != null) {formData["password"] = value}
                        },
                      ),
                      FLTextFormField(
                        labelText: "Confirm Password",
                        hintText: "Confirm your Password.",
                        isPasswordField: true,
                        validator: (value) => _isPasswordConfirm(value),
                      ),
                      SizedBox(height: 16.0),
                      FLPrimaryButton(
                        buttonText: "Sign Up",
                        onTap: _onSignUpTap,
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have your account?  ",
                            style: FLTextStyles.infoTextEng,
                          ),
                          GestureDetector(
                            onTap: _onLoginTap,
                            child: Text(
                              "Log In",
                              style: FLTextStyles.infoTextBoldEng,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
