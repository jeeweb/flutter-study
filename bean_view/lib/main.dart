import 'package:bean_view/screens/coffee_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BeanView());
}

class BeanView extends StatelessWidget {
  const BeanView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CoffeeListScreen(),
    );
  }
}
