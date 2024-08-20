import 'package:tang_router/tang_router_invoke.dart';

class InvokeRegister extends TRouterInvokeRegister {
  @override
  List<TRouterInvoke> register() {
    return [
      InvokeA(),
      InvokeB(),
    ];
  }
}

/// Business invoke A.
class InvokeA extends TRouterInvoke {
  @override
  String get methodName => 'testMethodA';

  @override
  Future? invoke(Map<String, dynamic>? params) {
    return Future.value('The result of InvokeA: ${params?.toString() ?? ''}');
  }
}

/// Business invoke B.
class InvokeB extends TRouterInvoke {
  @override
  String get methodName => 'testMethodB';

  @override
  Future? invoke(Map<String, dynamic>? params) {
    return Future.value('The result of InvokeB: ${params?.toString() ?? ''}');
  }
}