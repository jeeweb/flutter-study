import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  bool _visible = true;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Implict Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(
                begin: Colors.yellow,
                end: Colors.red,
              ),
              curve: Curves.bounceInOut,
              duration: Duration(seconds: 10),
              builder: (context, value, child) {
                return Image.network(
                  "https://miro.medium.com/v2/resize:fit:1400/1*W1aGmyVwe5kKGuyTvzdUEg.png",
                  color: value,
                  colorBlendMode: BlendMode.colorBurn,
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: _trigger,
              child: Text('Go!'),
            ),
          ],
        ),
      ),
    );
  }
}
