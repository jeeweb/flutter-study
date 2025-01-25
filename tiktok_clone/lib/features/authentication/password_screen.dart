import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState(); // 모든 것의 가장 앞에 super.initState() 선언
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
    _passwordController.dispose();
    super.dispose(); // 모든 것의 마지막에 super.dispose() 선언
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});

    /*
    ## 1
    if (_obscureText == true) {
      _obscureText = false;
    } else {
      _obscureText = true;
    }
    setState(() {});
    
    ## 2
    if (_obscureText == true) {
      setState(() {
        _obscureText = false;
      });
    } else {
      setState(() {
        _obscureText = true;
      });
    }
    */
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Sign up"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v16,
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
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h16,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
                    hintText: "Make it strong!", // placeholder
                    enabledBorder: UnderlineInputBorder(
                      // input 기본 border 컬러
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // focus 되었을 때의 border 컬러
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor, // 커서의 색상을 정의
                ),
                Gaps.v10,
                const Text(
                  'Your password must have:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: Sizes.size20,
                      color: _isPasswordValid()
                          ? Colors.green
                          : Colors.grey.shade400,
                    ),
                    Gaps.h5,
                    const Text("8 to 20 characters")
                  ],
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                    disabled: !_isPasswordValid(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
