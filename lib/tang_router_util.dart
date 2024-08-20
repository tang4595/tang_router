part of 'tang_router.dart';

// Public - Utils

extension PublicUtils on TRouter {

  /// Registering the routes with the [routerRegister] abstract class
  /// of register instance.
  register(TRouterRegister routerRegister) {
    /// Registering routes.
    if (_isRegisterCompleted) return;
    _routes.addAll(routerRegister.register());

    /// Registering invokes.
    if (routerRegister.invokes == null) return;
    final invokes = routerRegister.invokes?.register() ?? [];
    for (final targetInvoke in invokes) {
      final key = invokesKey(routerRegister, targetInvoke);
      _invokes[key] = targetInvoke;
    }
  }

  /// Batch registering router with the given [routerRegisters] list.
  batchRegister(List<TRouterRegister> routerRegisters) {
    if (_isRegisterCompleted) return;
    for (final reg in routerRegisters) {
      register(reg);
    }
  }

  /// Assemble the method-invoke cache key.
  String invokesKey(
      TRouterRegister routerRegister,
      TRouterInvoke routerInvoke) {
    return assembleInvokesKey(
      routerRegister.moduleName,
      routerInvoke.methodName,
    );
  }

  /// Assemble the method-invoke cache key.
  String assembleInvokesKey(String moduleName, String methodName) {
    return '$moduleName:$methodName';
  }
}