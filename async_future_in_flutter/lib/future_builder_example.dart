import 'package:flutter/material.dart';

class FutureBuilderExpamle extends StatefulWidget {
  const FutureBuilderExpamle({super.key});

  @override
  State<FutureBuilderExpamle> createState() => _FutureBuilderExpamleState();
}

class _FutureBuilderExpamleState extends State<FutureBuilderExpamle> {
  Future<String> getStringFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return '1234';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Пример FutureBuilder'),
      ),
      body: FutureBuilder(
        initialData: '',
        future: getStringFuture(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Ошибка'),
              );
            }
            if (snapshot.hasData) {
              return Center(
                child: Text(snapshot.data!),
              );
            }
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Container();
          }

          return Container();
        },
      ),
    );
  }
}
