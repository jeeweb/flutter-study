import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding/screens/create_account_screen.dart';
import 'package:twitter_onboarding/widgets/primary_button.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  final String username;
  final String contactInfo;
  final String birth;
  const CustomizeExperienceScreen(
      {super.key,
      required this.username,
      required this.contactInfo,
      required this.birth});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  void _onNextTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => CreateAccountScreen(
              isCheckedTerms: true,
              username: widget.username,
              contactInfo: widget.contactInfo,
              birth: widget.birth)),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customize your experience',
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
                  'Track where you see Twitter content across the web',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 32,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                      CupertinoSwitch(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value;
                          });
                        },
                        activeTrackColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'By signing up, you agree to our ',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Text(
                      'Terms',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Text(
                      ', ',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Text(
                      'Privacy ',
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
                      'Policy',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Text(
                      ', and ',
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
                      '. Twitter may use your',
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
                      'contact information, including your email address',
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
                      'and phone number for purposes outlined in our',
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
                      'Privacy Policy. ',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Text(
                      'Learn more',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () => _onNextTap(context),
              child: PrimaryButton(
                  text: 'Next', isPrimary: false, isDiabled: !_isChecked),
            ),
          ],
        ),
      ),
    );
  }
}
