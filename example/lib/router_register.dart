import 'package:example/example_page.dart';
import 'package:example/invoke_register.dart';
import 'package:tang_router/tang_router.dart';
import 'package:tang_router/tang_router_invoke.dart';

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

/// User
class RouterRegisterUser extends TRouterRegister {
  @override
  String get moduleName => 'user';

  @override
  List<TRoute> register() {
    return [
      TRoute(
        this,
        routePath: '/login',
        builder: (context, state) {
          return ExamplePage(value: getName('/login'));
        },
      ),

      TRoute(
        this,
        routePath: '/info',
        requiredLogin: true,
        builder: (context, state) {
          return ExamplePage(value: getName('/info'));
        },
      ),
    ];
  }
}

/// Example A
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

  @override
  TRouterInvokeRegister? get invokes => InvokeRegister();
}

/// Example B
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

  @override
  TRouterInvokeRegister? get invokes => InvokeRegister();
}