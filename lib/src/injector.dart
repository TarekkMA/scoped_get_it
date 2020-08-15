import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:scoped_get_it/src/scoped_injector.dart';

/// Injector is a widget that simply holds a referance to the base GetIt instance
class Injector extends StatelessWidget {
  final GetIt sl;
  final Widget child;
  const Injector({
    Key key,
    @required this.sl,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }

  static Injector of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<Injector>();

  static D get<D>(
    BuildContext context, {
    String instanceName,
    dynamic param1,
    dynamic param2,
    bool scoped = false,
  }) {
    if (scoped) {
      return ScopedInjector.get(
        context,
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );
    }
    return of(context).sl.get<D>(
          instanceName: instanceName,
          param1: param1,
          param2: param2,
        );
  }
}
