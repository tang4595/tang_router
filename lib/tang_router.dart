library tang_router;

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tang_router/tang_router_invoke.dart';
import 'package:tang_router/tang_router_register.dart';

export 'package:go_router/go_router.dart';
export 'package:tang_router/tang_router_register.dart';

part 'tang_router_util.dart';

class TRouter {
  factory TRouter() => _getInstance();
  static TRouter _getInstance() { return _instance; }
  static TRouter get shared => _getInstance();
  static final TRouter _instance = TRouter._internal();
  TRouter._internal();

  /// The [completeRegister] method has been invoked at this launch-session.
  bool _isRegisterCompleted = false;

  /// Router instance.
  late GoRouter _router;

  /// All routes list.
  final List<TRoute> _routes = [];

  /// All method-invokes list.
  /// Key: 'moduleName:methodName'.
  /// Value: 'TRouterInvoke'.
  final Map<String, TRouterInvoke> _invokes = {};

  /**
   * Static util wrappers.
   * Directly invoke the [shared] instance's methods with the same parameters.
   */

  /// Referring to the comments in the [GoRouter] file.
  static bool get canPop => TRouter.shared._router.routerDelegate.canPop();

  /// Referring to the comments in the [GoRouter] file.
  static String namedLocation(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
      }) =>
      TRouter.shared._router.namedLocation(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  /// Referring to the comments in the [GoRouter] file.
  static void go(String location, {Object? extra}) =>
      TRouter.shared._router.go(location, extra: extra);

  /// Referring to the comments in the [GoRouter] file.
  static void restore(RouteMatchList matchList) =>
      TRouter.shared._router.restore(matchList);

  /// Referring to the comments in the [GoRouter] file.
  static void goNamed(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) =>
      TRouter.shared._router.goNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  /// Referring to the comments in the [GoRouter] file.
  static Future<T?> push<T extends Object?>(
      String location, {
        Object? extra,
      }) async =>
      TRouter.shared._router.push(location, extra: extra);

  /// Referring to the comments in the [GoRouter] file.
  static Future<T?> pushNamed<T extends Object?>(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) =>
      TRouter.shared._router.pushNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  /// Referring to the comments in the [GoRouter] file.
  static Future<T?> pushReplacement<T extends Object?>(
      String location, {
        Object? extra,
      }) =>
      TRouter.shared._router.pushReplacement(location, extra: extra);

  /// Referring to the comments in the [GoRouter] file.
  static Future<T?> pushReplacementNamed<T extends Object?>(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) =>
      TRouter.shared._router.pushReplacementNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  /// Referring to the comments in the [GoRouter] file.
  static Future<T?> replace<T>(String location, {Object? extra}) =>
      TRouter.shared._router.replace(location, extra: extra);

  /// Referring to the comments in the [GoRouter] file.
  static Future<T?> replaceNamed<T>(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) =>
      TRouter.shared._router.replaceNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  /// Referring to the comments in the [GoRouter] file.
  static void pop<T extends Object?>([T? result]) =>
      TRouter.shared._router.pop(result);

  /// Referring to the comments in the [GoRouter] file.
  static void refresh() => TRouter.shared._router.refresh();

  /// Referring to the comments in the [GoRouter] file.
  static GoRouter of(BuildContext context) => GoRouter.of(context);

  /// Referring to the comments in the [GoRouter] file.
  static GoRouter? maybeOf(BuildContext context) => GoRouter.maybeOf(context);

  /// Referring to the comments in the [GoRouter] file.
  static void dispose() => TRouter.shared._router.dispose();

  /**
   * Method invokes.
   * Directly invoke the [shared] instance's methods with the same parameters.
   * */

  /// Invoking the method and returning a value. the parameter and values can
  /// be null.
  /// The [moduleName] and [methodName] is required.
  static Future<dynamic>? invoke(String moduleName, String methodName, {
    Map<String, dynamic>? params,
  }) {
    final key = TRouter.shared.assembleInvokesKey(moduleName, methodName);
    final targetInvoke = TRouter.shared._invokes[key];
    if (targetInvoke == null) return null;
    return targetInvoke.invoke(params);
  }
}

// Getter

extension Getters on TRouter {

  GoRouter get router => _router;
  List<TRoute> get routes => _routes;
  Map<String, TRouterInvoke> get invokes => _invokes;
}

// Public

extension Public on TRouter {

  /// Initializing router helper.
  Future<bool> setup({
    Codec<Object?, Object?>? extraCodec,
    GoExceptionHandler? onException,
    GoRouterPageBuilder? errorPageBuilder,
    GoRouterWidgetBuilder? errorBuilder,
    GoRouterRedirect? redirect,
    Listenable? refreshListenable,
    int redirectLimit = 5,
    bool routerNeglect = false,
    String? initialLocation,
    bool overridePlatformDefaultLocation = false,
    Object? initialExtra,
    List<NavigatorObserver>? observers,
    bool debugLogDiagnostics = false,
    GlobalKey<NavigatorState>? navigatorKey,
    String? restorationScopeId,
    bool requestFocus = true,
  }) async {
    if (_isRegisterCompleted || _routes.isEmpty) return false;
    _isRegisterCompleted = true;
    _router = GoRouter(
      routes: _routes,
      extraCodec: extraCodec,
      onException: onException,
      errorPageBuilder: errorPageBuilder,
      errorBuilder: errorBuilder,
      redirect: redirect,
      refreshListenable: refreshListenable,
      redirectLimit: redirectLimit,
      routerNeglect: routerNeglect,
      initialLocation: initialLocation,
      overridePlatformDefaultLocation: overridePlatformDefaultLocation,
      initialExtra: initialExtra,
      observers: observers,
      debugLogDiagnostics: debugLogDiagnostics,
      navigatorKey: navigatorKey,
      restorationScopeId: restorationScopeId,
      requestFocus: requestFocus,
    );
    return true;
  }
}