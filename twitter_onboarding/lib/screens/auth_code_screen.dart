import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding/screens/password_screen.dart';
import 'package:twitter_onboarding/widgets/primary_button.dart';

class AuthCodeScreen extends StatefulWidget {
  const AuthCodeScreen({super.key});

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreenState();
}

class _AuthCodeScreenState extends State<AuthCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<int> _formData = List.filled(6, 0);
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  String email = 'jhon.mobbin@gmail.com';
  bool _isFormValid = false;

  void _checkFormValid() {
    _isFormValid =
        _controllers.every((controller) => controller.text.isNotEmpty);
    setState(() {});
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PasswordScreen(),
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
              'We sent you a code',
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
              'Enter it below to verify\n$email.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
                letterSpacing: 0.1,
              ),
            ),
            SizedBox(
              height: 56.0,
            ),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  for (var i = 0; i < 6; i++) ...[
                    Expanded(
                      child: TextFormField(
                        controller: _controllers[i],
                        focusNode: _focusNodes[i],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 3,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        onChanged: (value) {
                          if (value.length == 1) {
                            if (i < 6 - 1) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[i + 1]);
                            } else {
                              _focusNodes[i].unfocus();
                            }
                          }
                          _checkFormValid();
                        },
                        onSaved: (newValue) {
                          if (newValue != null && newValue.isNotEmpty) {
                            _formData[i] = int.parse(newValue);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(
              height: 54.0,
            ),
            if (_isFormValid)
              Container(
                alignment: Alignment.center,
                child: const FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: Colors.green,
                ),
              )
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
            onTap: _onNextTap,
            child: PrimaryButton(
                text: 'Next',
                isPrimary: false,
                isDiabled: _isFormValid ? false : true),
          ),
        ),
      ),
    );
  }
}
