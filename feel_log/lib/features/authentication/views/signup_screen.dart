import 'package:flutter/material.dart';
import 'package:feel_log/features/authentication/views/widgets/text_field_input.dart';
import 'package:feel_log/features/authentication/views/widgets/primary_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/core.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  String _username = "";
  String _email = "";
  String _password = "";
  String _passwordConfirm = "";

  @override
  void initState() {
    super.initState();
    usernameController.addListener(() {
      setState(() {
        _username = usernameController.text;
      });
    });
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
    passwordController.addListener(() {
      setState(() {
        _passwordConfirm = passwordConfirmController.text;
      });
    });
  }

  void _onLoginTap() {
    Navigator.pop(context);
  }

  void _onSignUpTap() {}

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
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
                        FontAwesomeIcons.arrowLeft,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 44.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 18.0),
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
                child: Column(
                  children: [
                    FLTextFieldInput(
                      controller: usernameController,
                      labelText: "Username",
                      hintText: "Make your Username.",
                    ),
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
                    FLTextFieldInput(
                      controller: passwordConfirmController,
                      labelText: "Confirm Password",
                      hintText: "Confirm your Password.",
                      isPasswordField: true,
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
                          style: FLTextStyles.infoText,
                        ),
                        GestureDetector(
                          onTap: _onLoginTap,
                          child: Text(
                            "Log In",
                            style: FLTextStyles.infoTextBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
