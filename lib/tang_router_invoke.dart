abstract class TRouterInvoke {

  /// The method name.
  String get methodName;

  /// Invoking the method and returning a value. the parameter and values can
  /// be null.
  Future<dynamic>? invoke(Map<String, dynamic>? params);
}

abstract class TRouterInvokeRegister {

  /// The invokes definition.
  List<TRouterInvoke> register();
}