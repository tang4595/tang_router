import 'package:flutter/foundation.dart';
import 'package:tang_router/tang_router.dart';

class RouterLoginPlugin extends TRouterLoginPlugin {
  @override
  didRedirected(String routePath) {
    if (kDebugMode) {
      print('The router did redirected to $routePath');
    }
  }

  @override
  bool get isLogin => false;

  @override
  String get loginRoutePath => '/user/login';
}