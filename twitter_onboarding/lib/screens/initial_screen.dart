import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding/screens/create_account_screen.dart';
import 'package:twitter_onboarding/screens/auth_code_screen.dart';
import 'package:twitter_onboarding/widgets/primary_button.dart';
import 'package:twitter_onboarding/widgets/secondary_icon_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AuthCodeScreen()
          // builder: (context) => CreateAccountScreen(
          //   isCheckedTerms: false,
          // ),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 100.0,
                bottom: 120.0,
              ),
              child: Text(
                'See what\'s happening in the world right now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 31.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: SecondaryIconButton(
                text: 'Continue with Google',
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  size: 26.0,
                  color: Color(0xFFD95242),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: SecondaryIconButton(
                text: 'Continue with Apple',
                icon: FaIcon(
                  FontAwesomeIcons.apple,
                  size: 30.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Text(
                'or',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onCreateAccountTap(context),
              child: PrimaryButton(
                text: 'Create account',
                isPrimary: false,
                isDiabled: false,
              ),
            ),
            SizedBox(
              height: 36.0,
            ),
            Row(
              children: [
                Text(
                  'By signing up, you agree to our',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Terms',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  ',',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  ', and ',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Cookie Use.',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 64.0,
            ),
            Row(
              children: [
                Text(
                  'Have an account already?',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
