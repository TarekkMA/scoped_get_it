import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scoped_get_it/scoped_get_it.dart';
import 'counter_widget.dart';

final sl = GetIt.I;

void main() {
  sl.registerFactory<CounterNotifer>(
      () => CounterNotifer(Random().nextInt(1000)));
  runApp(
    Injector(
      sl: sl,
      child: MyApp(),
    ),
  );
}

class CounterNotifer extends ValueNotifier<int> {
  CounterNotifer(int value) : super(value);

  void inc() {
    value++;
  }

  void dec() {
    value--;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: MediaQuery.of(context).padding,
        crossAxisCount: 3,
        children: buildCounterList(3 * 10),
      ),
    );
  }

  List<Widget> buildCounterList(int len) {
    final list = List<Widget>(len);
    for (var i = 0; i < len; i++) list[i] = CounterWidget();
    return list;
  }
}
