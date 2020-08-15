import 'package:flutter/material.dart';
import 'package:scoped_get_it/scoped_get_it.dart';

import 'main.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedInjector(
      child: Column(
        children: [
          CounterText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AddButton(), SubtractButton()],
          )
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: context.injectScoped<CounterNotifer>(),
      builder: (context, value, _) => Text(
        value.toString(),
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => context.injectScoped<CounterNotifer>().inc(),
    );
  }
}

class SubtractButton extends StatelessWidget {
  const SubtractButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () => context.injectScoped<CounterNotifer>().dec(),
    );
  }
}
