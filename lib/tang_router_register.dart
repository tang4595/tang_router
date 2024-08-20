import 'package:go_router/go_router.dart';
import 'package:tang_router/tang_router_invoke.dart';

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

  /** Required. */

  /// The name of module.
  String get moduleName;

  /// The page router definition.
  List<TRoute> register();

  /** Optional. */

  /// The method invokes.
  TRouterInvokeRegister? get invokes => null;

  /// The root page that mapped to the path named `/`.
  /// The [moduleName] will be ignore if [isRoot] set to `true`. default is
  /// `false`.
  bool get isRoot => false;

  /// The final module name.
  String get finalModuleName {
    if (isRoot) return '';
    return moduleName.isEmpty ? '' : '/$moduleName';
  }

  /// Appending the final route path with the given [path] name.
  String getPath(String path) =>
      '$finalModuleName${path.contains('/') ? '' : '/'}$path';

  /// Appending the route name with the given [path] name.
  String getName(String path) =>
      '$finalModuleName-${path.contains('/')
          ? path.replaceFirst('/', '')
          : path}';
}