import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostReport extends StatelessWidget {
  const PostReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "Report",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Why are you reporting this thread?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black45,
                        height: 1.2,
                        letterSpacing: 0.1,
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFE0E0E0),
                thickness: 1.0,
                indent: 0,
                height: 0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("I just don't like it",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: Color(0xFFCCCCCC),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("It's unlawful content under NetzDG",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: Color(0xFFCCCCCC),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("It's spam",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: Color(0xFFCCCCCC),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hate speech or symbols",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: Color(0xFFCCCCCC),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nudity or sexual activity",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: Color(0xFFCCCCCC),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("No Reason",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: Color(0xFFCCCCCC),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 52.0),
            ],
          ),
        ),
      ),
    );
  }
}
