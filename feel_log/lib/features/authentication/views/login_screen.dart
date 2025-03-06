import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:feel_log/router/router_constants.dart';
import 'package:feel_log/features/authentication/views/widgets/primary_button.dart';
import 'package:feel_log/features/authentication/views/widgets/text_field_input.dart';
import '../../../core/core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        _email = emailController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        _password = passwordController.text;
      });
    });
  }

  void _onLoginTap(BuildContext context) {}

  void _onSignUpTap() {
    context.push(RouteURL.signUp);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              child: FLLogo(),
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
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: FLTextStyles.headline,
                      ),
                      SizedBox(height: 24.0),
                      FLTextFieldInput(
                        controller: emailController,
                        labelText: "Email",
                        hintText: "Write your Email Address.",
                      ),
                      FLTextFieldInput(
                        controller: passwordController,
                        labelText: "Password",
                        hintText: "More than 8 characters.",
                        isPasswordField: true,
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
                            style: FLTextStyles.infoText,
                          ),
                          GestureDetector(
                            onTap: _onSignUpTap,
                            child: Text(
                              "Sign Up",
                              style: FLTextStyles.infoTextBold,
                            ),
                          ),
                        ],
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
