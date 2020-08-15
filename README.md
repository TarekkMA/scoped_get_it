# scoped_get_it

GetIt with scopes :).

## :warning: Read First

This package is new and API maybe unstable, you are welcome to reach the source code,it is very simple, and decide if want to use it in your project. Also check out the [example](./example)

:star: PRs are always welcome.

## Installation

```yaml
dependencies:
  get_It:
  scoped_get_it:
```

## How does this package works?

It proxies calls to `GetIt` and caches them as singleton in an internal `GetIt` instance for each scope defined.

### `Injector` Widget

This widget stores your global `GetIt` instance to later be used in `ScopedInjector` widget, also you simply provide your global `GetIt` instance to `ScopedInjector` each time you construct one through `base` field.

```dart
Injector(
  sl: sl,
  child: MyApp(),
);
```

### `ScopedInjector` Widget

This widget proxies calls to the global GetIt instance and stores them as singletons in a local GetIt instance.

```dart
ScopedInjector(
  base: sl, /*use if you don't have an Injector parent*/
  child: ...
);
```

## How to use this package?

1. Initialize your global GetIt instance and populate it. (check out [injectable](https://pub.dev/packages/injectable)).
2. Wrap your app with `Injector` widget and pass it your global GetIt instance.
   1. You can skip this step and pass the global GetIt instance to each scope instead.
3. Wrap the part of tree you want a singleton scope to be defined at with `ScopedInjector` widget.
4. Use `ScopedInjector.get<D>(BuildContext,...)` to get your scoped dependencies.
   1. You can also use `context.injectScoped<D>()`
