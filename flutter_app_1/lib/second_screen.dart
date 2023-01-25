import 'package:flutter/material.dart';
import 'package:flutter_app_1/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  void navigateToThirdScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ThirdScreen(),
      ),
    );
  }

  void popFromScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Second'),
    ));
  }
}
