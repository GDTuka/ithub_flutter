import 'package:flutter/material.dart';
import 'package:flutter_local_storage_example/data/models/todo_list_model/todo_list_model.dart';
import 'package:flutter_local_storage_example/data/models/todo_model/todo_model.dart';
import 'package:flutter_local_storage_example/data/source/todo_source/todo_local_data_source.dart';

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
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TodoLocalDataSource todoLocalDataSource = TodoLocalDataSource();

  Future<void> addNewTodo(TodoModel todoModel) async {
    await saveNewTodo(todoModel);
  }

  Future<void> saveNewTodo(TodoModel todoModel) async {
    await todoLocalDataSource.saveTodo(todoModel);
  }

  Future<TodoListModel?> loadTodos() async {
    TodoListModel? todo = await todoLocalDataSource.loadTodo();

    await Future.delayed(const Duration(seconds: 2));

    return todo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('LocalStorage and json'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              FutureBuilder(
                future: loadTodos(),
                builder: (context, AsyncSnapshot<TodoListModel?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if (snapshot.data == null) {
                        return Container();
                      }

                      return Column(
                        children: [
                          for (int i = 0; i < snapshot.data!.todoListModel!.length; i++) ...[
                            Text(snapshot.data!.todoListModel![i].header),
                            Text(snapshot.data!.todoListModel![i].description),
                          ]
                        ],
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.active) {}

                  return Container();
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  await addNewTodo(TodoModel(description: '4321', header: '1234'));
                  setState(() {});
                },
                child: const Text('newTodo 1234'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await addNewTodo(TodoModel(description: 'New', header: 'NewNew'));
                  setState(() {});
                },
                child: const Text('newTodo New'),
              ),
            ],
          ),
        ));
  }
}
