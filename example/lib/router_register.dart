import 'package:example/example_page.dart';
import 'package:tang_router/tang_router.dart';

class RouterRegisterRoot extends TRouterRegister {
  @override
  String get moduleName => '';

  @override
  List<TRoute> register() => [
    TRoute(
      this,
      routePath: '/',
      builder: (context, state) {
        return const ExamplePage(value: 'Root');
      },
    ),
  ];
}

class RouterRegisterA extends TRouterRegister {
  @override
  String get moduleName => 'businessA';

  @override
  List<TRoute> register() {
    return [
      TRoute(
        this,
        routePath: '/home',
        builder: (context, state) {
          return ExamplePage(value: getName('/home'));
        },
      ),
      TRoute(
        this,
        routePath: '/search',
        builder: (context, state) {
          return ExamplePage(value: getName('/search'));
        },
      ),
      TRoute(
        this,
        routePath: '/detail',
        builder: (context, state) {
          return ExamplePage(value: getName('/detail'));
        },
      ),
    ];
  }
}

class RouterRegisterB extends TRouterRegister {
  @override
  String get moduleName => 'businessB';

  @override
  List<TRoute> register() {
    return [
      TRoute(
        this,
        routePath: '/home',
        builder: (context, state) {
          return ExamplePage(value: getName('/home'));
        },
      ),
      TRoute(
        this,
        routePath: '/search',
        builder: (context, state) {
          return ExamplePage(value: getName('/search'));
        },
      ),
      TRoute(
        this,
        routePath: '/detail',
        builder: (context, state) {
          return ExamplePage(value: getName('/detail'));
        },
      ),
    ];
  }
}