import 'package:go_router/go_router.dart';

/// The main route entity wrapper.
class TRoute extends GoRoute {

  /// The register instance.
  final TRouterRegister routerRegister;

  /// The route path.
  final String routePath;

  /// The route name (Optional), default is generate with [TRouterRegister].
  final String? routeName;

  TRoute(this.routerRegister, {
    required this.routePath,
    this.routeName,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.onExit,
    super.routes,
  }) : super(
    path: routerRegister.getPath(routePath),
    name: routeName ?? routerRegister.getName(routePath),
  );
}

/// Register implements of the every single routes.
abstract class TRouterRegister {

  /// The name of module.
  String get moduleName;

  /// The final module name.
  String get finalModuleName => moduleName.isEmpty ? '' : '/$moduleName';

  /// Appending the final route path with the given [path] name.
  String getPath(String path) =>
      '$finalModuleName${path.contains('/') ? '' : '/'}$path';

  /// Appending the route name with the given [path] name.
  String getName(String path) =>
      '$finalModuleName-${path.contains('/')
          ? path.replaceFirst('/', '')
          : path}';

  /// The router definition.
  List<TRoute> register();
}