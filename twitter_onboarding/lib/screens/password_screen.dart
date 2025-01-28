import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding/screens/interests_screen.dart';
import 'package:twitter_onboarding/widgets/primary_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _passwordController.addListener(
      () {
        setState(() {
          _password = _passwordController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterestsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: 36.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 36.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You\'ll need a password',
              style: TextStyle(
                fontSize: 31.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.1,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Make sure it\'s 8 characters or more',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
                letterSpacing: 0.1,
              ),
            ),
            SizedBox(
              height: 56.0,
            ),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              onEditingComplete: _onSubmit,
              obscureText: _obscureText,
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _toggleObscureText,
                      child: FaIcon(
                        _obscureText
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        color: Colors.grey.shade400,
                        size: 20.0,
                      ),
                    ),
                    if (_password.length >= 8)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Color(0xFF54B882),
                          size: 20.0,
                        ),
                      )
                  ],
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 36.0,
            ),
            child: GestureDetector(
              onTap: _onSubmit,
              child: PrimaryButton(
                  text: 'Next',
                  isPrimary: false,
                  isDiabled: _password.length >= 8 ? false : true),
            )),
      ),
    );
  }
}
