/// The user status fetching-tool plugin.
abstract class TRouterLoginPlugin {
  /// The route path of Login Page.
  String get loginRoutePath;

  /// The login status.
  bool get isLogin;

  /// The Router has been redirected to the route named [routePath].
  didRedirected(String routePath);
}