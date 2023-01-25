import 'package:flutter/material.dart';

class ScreenWithData extends StatelessWidget {
  ScreenWithData({
    super.key,
    required this.id,
  });

  final int id;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: TextField(
          controller: controller,
        ),
      ),
    );
  }
}


//* 
//* В приложении есть 3 экрана, гланвый экран с текстовым полем, и двумя кнопками
//* Первая кнопка отправляет на эран "2",
//* Вторая кнопка отпраавляет на экран "3",
//* Задача передать при переходе на экран 2 передать текст написанный пользователем в текстовом поле, отобразить где-то на "2" экране
//* Передать при переходе на экран 3 текст записанный в текстовом поле, отобразить его как текст который уже был написано в текстовом поле на экране "3"