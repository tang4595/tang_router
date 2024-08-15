part of 'tang_router.dart';

// Public - Utils

extension PublicUtils on TRouter {

  /// Registering the routes with the [routerRegister] abstract class
  /// of register instance.
  register(TRouterRegister routerRegister) {
    if (_isRegisterCompleted) return;
    _routes.addAll(routerRegister.register());
  }

  /// Batch registering router with the given [routerRegisters] list.
  batchRegister(List<TRouterRegister> routerRegisters) {
    if (_isRegisterCompleted) return;
    for (final reg in routerRegisters) {
      register(reg);
    }
  }
}