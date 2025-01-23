import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding/screens/customize_experience_screen.dart';
import 'package:twitter_onboarding/widgets/primary_button.dart';

class CreateAccountScreen extends StatefulWidget {
  final String? username;
  final String? contactInfo;
  final String? birth;
  final bool _isCheckedTerms;
  const CreateAccountScreen(
      {super.key,
      required bool isCheckedTerms,
      this.username,
      this.contactInfo,
      this.birth})
      : _isCheckedTerms = isCheckedTerms;

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _contactInfoController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();

  String _username = '';
  String _contactInfo = '';
  String _birth = '';

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState(); // 모든 것의 가장 앞에 super.initState() 선언
    _usernameController.addListener(
      () {
        setState(() {
          _username = _usernameController.text;
        });
      },
    );
    _contactInfoController.addListener(
      () {
        setState(() {
          _contactInfo = _contactInfoController.text;
        });
      },
    );

    _setTextFieldDate(initialDate);
    _birth = '$initialDate';
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _contactInfoController.dispose();
    _birthController.dispose();
    super.dispose();
  }

  String? _isContactInfoValid() {
    if (_contactInfo.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_contactInfo)) {
      return "Not valid";
    }
    return null;
  }

  // void _formatedDate(DateTime date) {
  //   String formattedDate = DateFormat.yMMMd().format(date);
  //   _birthController.value = TextEditingValue(text: formattedDate);
  //   _birth = formattedDate;
  // }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthController.value = TextEditingValue(text: textDate);
  }

  void _onNextTap() {
    if (_username.isEmpty || _contactInfo.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomizeExperienceScreen(
            username: _username, contactInfo: _contactInfo, birth: _birth),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                'Create your account',
                style: TextStyle(
                  fontSize: 31.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.1,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
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
                    suffixIcon: FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: 36.0,
                      color: _username.isEmpty
                          ? Colors.transparent
                          : Color(0xFF54B882),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: TextField(
                  controller: _contactInfoController,
                  decoration: InputDecoration(
                    labelText: 'Phone number or email address',
                    errorText: _isContactInfoValid(),
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
                    suffixIcon: FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: 36.0,
                      color: _contactInfo.isEmpty
                          ? Colors.transparent
                          : Color(0xFF54B882),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: TextField(
                  readOnly: true,
                  controller: _birthController,
                  decoration: InputDecoration(
                    labelText: 'Date of birth',
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
                    suffixIcon: FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: 36.0,
                      color: Color(0xFF54B882),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
              widget._isCheckedTerms
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'By signing up, you agree to the ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              'Terms of Service',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'and ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              ', including ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              'Cookie Use',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              '. Twitter',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'may use your contact information, including your',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'email address and phone number for purposes',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'outlined in our Privacy Policy, like keeping your',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'account secure and personalizing our services,',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'including ads. ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              'Learn more.',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              'Others will be able to',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'find you by email or phone number, when',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'provided, unless you choose otherwise ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                                letterSpacing: 0.2,
                              ),
                            ),
                            Text(
                              'here.',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: _onNextTap,
                          child: PrimaryButton(
                              text: 'Sign up',
                              isPrimary: true,
                              isDiabled: false),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: _onNextTap,
                      child: PrimaryButton(
                          text: 'Next',
                          isPrimary: false,
                          isDiabled: _username.isEmpty || _contactInfo.isEmpty),
                    ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          height: widget._isCheckedTerms ? 1 : 200,
          child: widget._isCheckedTerms
              ? SizedBox(
                  height: 1,
                )
              : CupertinoDatePicker(
                  maximumDate: initialDate,
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: _setTextFieldDate,
                ),
        ),
      ),
    );
  }
}
