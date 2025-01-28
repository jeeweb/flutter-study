import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_onboarding/widgets/interest_small_button.dart';

const detailInterest1 = [
  "Rap",
  "R&B & Soul",
  "Grammy Awards",
  "Pop",
  "K-pop",
  "Music industry",
  "EDM",
  "Music news",
  "Hip hop",
  "Reggae",
  "Alternative"
];
const detailInterest2 = [
  "Anime",
  "Movies & TV",
  "Harry Potter",
  "Marvel Universe",
  "Movie news",
  "Naruto",
  "Movies",
  "Grammy Awards",
  "Entertainment"
];
const detailInterest3 = [
  "City",
  "SightSeeing",
  "Nature",
  "Hiking",
  "Mountain",
  "Ocean",
  "vacation",
];

class InterestsDetailScreen extends StatefulWidget {
  const InterestsDetailScreen({super.key});

  @override
  State<InterestsDetailScreen> createState() => _InterestsDetailScreenState();
}

class _InterestsDetailScreenState extends State<InterestsDetailScreen> {
  final bool _isDisabled = false;

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
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Music",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: [
                          for (var detail in detailInterest1)
                            InterestSmallButton(interest: detail),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Divider(
                        height: 1.0,
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
                        child: Text(
                          "Entertainment",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: [
                          for (var detail in detailInterest2)
                            InterestSmallButton(interest: detail),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Divider(
                        height: 1.0,
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
                        child: Text(
                          "Travel",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: [
                          for (var detail in detailInterest3)
                            InterestSmallButton(interest: detail),
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
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 36.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 600,
                ),
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
                      onTap: () {},
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
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
