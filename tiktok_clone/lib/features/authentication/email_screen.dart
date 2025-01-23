import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailcontroller = TextEditingController();

  String _email = '';

  @override
  void initState() {
    super.initState(); // 모든 것의 가장 앞에 super.initState() 선언
    _emailcontroller.addListener(
      () {
        setState(() {
          _email = _emailcontroller.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose(); // 모든 것의 마지막에 super.dispose() 선언
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email Not valid";
    }
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
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
                  "What is your email?",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v16,
                TextField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onSubmit,
                  decoration: InputDecoration(
                    hintText: "Email", // placeholder
                    errorText: _isEmailValid(),
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
                Gaps.v16,
                GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(
                    disabled: _email.isEmpty || _isEmailValid() != null,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
