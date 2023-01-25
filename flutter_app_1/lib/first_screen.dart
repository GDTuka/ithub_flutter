import 'package:flutter/material.dart';
import 'package:flutter_app_1/screen_with_data.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  void navigateToScreenWithData(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenWithData(id: 3)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          navigateToScreenWithData(context);
        },
        child: const Center(
          child: Text('Navigate To Screen With Data'),
        ),
      ),
    );
  }
}
