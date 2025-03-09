import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:feel_log/router/router_constants.dart';
import 'package:feel_log/features/authentication/view_models/login_view_model.dart';
import 'package:feel_log/features/common/widgets/primary_button.dart';
import 'package:feel_log/features/common/widgets/text_field_input.dart';
import '../../../core/core.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

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
    return null;
  }

  void _onLoginTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref
            .read(loginProvider.notifier)
            .login(formData["email"]!, formData["password"]!, context);
      }
    }
  }

  void _onSignUpTap() {
    context.push(RouteURL.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .2,
              alignment: Alignment(0.0, 0.0),
              decoration: BoxDecoration(),
              child: FLLogo(
                isAuth: true,
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
                        Text(
                          "Login",
                          style: FLTextStyles.headlineBK,
                        ),
                        SizedBox(height: 24.0),
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
                        SizedBox(height: 16.0),
                        FLPrimaryButton(
                          buttonText: "Login",
                          onTap: _onLoginTap,
                        ),
                        SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have any account?  ",
                              style: FLTextStyles.infoTextEng,
                            ),
                            GestureDetector(
                              onTap: _onSignUpTap,
                              child: Text(
                                "Sign Up",
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
            ),
          ],
        ),
      ),
    );
  }
}
