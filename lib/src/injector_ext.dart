import 'package:flutter/material.dart';
import 'package:scoped_get_it/src/injector.dart';
import 'package:scoped_get_it/src/scoped_injector.dart';

extension InjectorExt on BuildContext {
  D injectScoped<D>({
    String instanceName,
    dynamic param1,
    dynamic param2,
  }) =>
      ScopedInjector.get(
        this,
        instanceName: instanceName,
        param1: param1,
        param2: param2,
      );

  D inject<D>({
    String instanceName,
    dynamic param1,
    dynamic param2,
    bool scoped,
  }) =>
      Injector.get(
        this,
        instanceName: instanceName,
        param1: param1,
        param2: param2,
        scoped: scoped,
      );
}
