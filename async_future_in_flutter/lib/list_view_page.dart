import 'package:async_future_in_flutter/second_page.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<String> taskName = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Большой список'),
      ),
      //* Специальная кнопка у виджта Scaffold
      floatingActionButton: GestureDetector(
        onTap: () async {
          String? newTask = await Navigator.of(context).push<String>(MaterialPageRoute(builder: (context) => const SecondPage()));
          if (newTask == null) return;
          //* Добавляем полученный таск в список задач
          setState(() {
            taskName.add(newTask);
          });
        },
        child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: const Icon(Icons.add)),
      ),
      body: ListView.builder(
        //* Выводим список задач указывая колличеством задач длинну массиваа taskName
        itemCount: taskName.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(taskName[index]),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            taskName.removeAt(index);
                          });
                        },
                        child: const Text('Завершить задачу')),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
