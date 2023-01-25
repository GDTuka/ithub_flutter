import 'package:async_future_in_flutter/future_builder_example.dart';
import 'package:async_future_in_flutter/second_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FutureBuilderExpamle(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//* Есть главный экран с ListView.builder(), в котором выводятся Todo,
//* На главном экране по нажатию на какую-то кнопку, можно перейти на экран с добавлением Todo()
//* На экране добавления туду, можно создать объект типа Todo, с данными название, время к которому нужно сделать задачу, описание задачи, приоритет задачи в виде Enum{hight,medium,small}, данные пользователь вводит сам
//* По Enum менять цвет виджета Todo на основном экране, на какой хотите, главное чтобы он был разный
//* Нужна возможность удаления задачи из списка
//* Реализовать экран с завершёнными задачами, там должны отображаться задачи, которые были завершены
//* !!!!! Необязатель !!!!! Реализовать загрузку главного экрана при возвращении на него с экран добавления задач

class Todo {
  Todo(
    this.description,
    this.header,
    this.id,
    this.taskPriority,
  );
  int id;
  String header;
  String description;
  TaskPriority taskPriority;
}

enum TaskPriority {
  hight,
  medium,
  low,
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> taskList = [];

  List<Todo> taskList2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('createTask'),
            onPressed: () async {
              //* Если мы хотим получить что-то с другого экрана, или к примеру сделать так, чтобы метод выполнился по возвращению с экрана
              //* Мы можем использовать await
              String? taskName = await Navigator.of(context).push<String?>(MaterialPageRoute(builder: (context) => const SecondPage()));
              if (taskName == null) return;
              setState(() {
                taskList.add(taskName);
              });
            },
          ),
          //* Можно использовать циклы внутри for , чтобы проходиться по массиву и выводить разлиные виджеты
          for (int i = 0; i < taskList.length; i++) ...[Text(taskList[i])]
        ],
      ),
    );
  }
}
