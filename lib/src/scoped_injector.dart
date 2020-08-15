import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:scoped_get_it/src/injector.dart';

/// ScopedInjector a widget that contains a local [GetIt] that proxies calls to
/// the base GetIt instance [ScopedInjector.base] and treats them as singletons
class ScopedInjector extends StatefulWidget {
  final GetIt base;
  final Widget child;
  const ScopedInjector({
    Key key,
    this.base,
    this.child,
  }) : super(key: key);

  @override
  ScopedInjectorState createState() => ScopedInjectorState();

  static ScopedInjectorState of(BuildContext context) {
    return context.findAncestorStateOfType<ScopedInjectorState>();
  }

  static D get<D>(
    BuildContext context, {
    String instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return of(context).get<D>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );
  }
}

class ScopedInjectorState extends State<ScopedInjector> {
  GetIt get _baseSl => widget.base ?? Injector.of(context).sl;
  final GetIt _scopedSl = GetIt.asNewInstance();

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  D get<D>({
    String instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    if (_scopedSl.isRegistered<D>(instanceName: instanceName)) {
      return _scopedSl.get(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );
    }
    final dep = _baseSl.get<D>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );

    _scopedSl.registerSingleton<D>(dep);

    return dep;
  }
}
