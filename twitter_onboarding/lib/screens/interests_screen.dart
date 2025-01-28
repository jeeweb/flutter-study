import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding/screens/interests_detail_screen.dart';
import 'package:twitter_onboarding/widgets/interest_large_button.dart';

const interests = [
  "Fashion & Beauty",
  "Outdoors",
  "Arts & Culture",
  "Animation & Comics",
  "Business & Finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Daily Life",
  "Animals",
  "Drama",
  "Learning",
  "Sports",
  "Fitness & Health",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final bool _isDisabled = false;

  void _onNextTab() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterestsDetailScreen(),
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
        padding: EdgeInsets.only(
          top: 24.0,
          left: 36.0,
          right: 36.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What do you want to see on Twitter?',
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
              'Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
                letterSpacing: 0.1,
              ),
            ),
            SizedBox(
              height: 28.0,
            ),
            Divider(
              height: 1.0,
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 28.0,
                ),
                child: SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      for (var interest in interests)
                        InterestLargeButton(interest: interest)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 36.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Great work 🎉"),
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 600,
                ),
                child: GestureDetector(
                  onTap: _onNextTab,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                        color: _isDisabled
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).indicatorColor,
                        borderRadius: BorderRadius.circular(
                          36.0,
                        )),
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(
                        milliseconds: 500,
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: _isDisabled ? Color(0xFFBFC3C6) : Colors.white,
                        letterSpacing: 0.1,
                      ),
                      child: GestureDetector(
                        onTap: _onNextTab,
                        child: Text(
                          "Next",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
