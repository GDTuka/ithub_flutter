import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elementary_example/home/home_wm.dart';

class HomeScreenWidget extends ElementaryWidget<IHomeWidgetModel> {
  const HomeScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = homeWidgetModelFactory,
  }) : super(key: key, wmFactory);

  @override
  Widget build(IHomeWidgetModel wm) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EntityStateNotifierBuilder<String>(
              listenableEntityState: wm.mainScreeenListenable,
              errorBuilder: (context, e, data) {
                return const Text('Error');
              },
              loadingBuilder: (context, data) {
                return const CircularProgressIndicator();
              },
              builder: (context, String? data) {
                if (data == null) return Container();

                return Text(data);
              },
            ),
            ElevatedButton(
              onPressed: () {
                wm.deleteTodo(5);
              },
              child: const Text('Tap'),
            )
          ],
        ),
      ),
    );
  }
}
