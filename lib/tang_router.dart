library tang_router;

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

abstract class TRouter {
  List<GoRoute> register(BuildContext? context);
}