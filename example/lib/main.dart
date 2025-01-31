import 'package:example/router_plugin.dart';
import 'package:example/router_register.dart';
import 'package:flutter/material.dart';
import 'package:tang_router/tang_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _setupRouter(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

GoRouter _setupRouter() {
  /// Root page.
  TRouter.shared.register(RouterRegisterRoot());

  /// Business routes.
  TRouter.shared.batchRegister([
    RouterRegisterA(),
    RouterRegisterB(),
    RouterRegisterUser(),
  ]);

  /// Completing setup.
  TRouter.shared.setup(
    loginPlugin: RouterLoginPlugin(),
  );
  return TRouter.shared.router;
}
