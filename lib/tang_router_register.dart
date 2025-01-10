import 'package:tang_router/tang_router.dart';
import 'package:tang_router/tang_router_invoke.dart';

/// The main route entity wrapper.
class TRoute extends GoRoute {

  /// The register instance.
  final TRouterRegister routerRegister;

  /// The route path.
  final String routePath;

  /// The route name (Optional), default is generate with [TRouterRegister].
  final String? routeName;

  /// If [requiredLogin] is set to true, the [redirect] method will be
  /// overridden and redirect to the LoginRoute if needed. if [customRedirect]
  /// is implemented, it will be ignored.
  final bool? requiredLogin;

  /// The custom implementation of [redirect].
  final GoRouterRedirect? customRedirect;

  TRoute(this.routerRegister, {
    required this.routePath,
    this.routeName,
    this.requiredLogin,
    this.customRedirect,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.onExit,
    super.routes,
  }) : super(
    path: routerRegister.getPath(routePath),
    name: routeName ?? routerRegister.getName(routePath),
    redirect: (context, state) {
      if (customRedirect != null) return customRedirect(context, state);
      if (!(requiredLogin ?? false)) return null;

      final loginPage = TRouter.shared.loginPlugin?.loginRoutePath ?? '';
      if (loginPage.isNotEmpty) {
        /// Status checking.
        final isLogin = TRouter.shared.loginPlugin?.isLogin ?? false;
        final destination = isLogin ? null : loginPage;

        /// Redirecting callback.
        if (destination != null) {
          TRouter.shared.loginPlugin?.didRedirected(destination);
        }
        return destination;
      }
      return null;
    },
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