import 'package:flutter/material.dart';
import 'package:ui_challenge/widgets/button.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 42,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hey, Selena',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromRGBO(255, 255, 255, 0.8),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [],
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 8,
                ),
                child: Text(
                  '\$5 194 482',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    text: 'Transfer',
                    bgColor: Color(0xFFF2B33A),
                    textColor: Color(0xFF181818),
                  ),
                  Button(
                    text: 'Request',
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
