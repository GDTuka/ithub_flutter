import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //* Передав в Navigator.of(context).pop(СЮДА) информацию, можно получить ее с экрана с которого мы перешли
            Navigator.of(context).pop('1234');
          },
          child: const Text('Тыкни'),
        ),
      ),
    );
  }
}
