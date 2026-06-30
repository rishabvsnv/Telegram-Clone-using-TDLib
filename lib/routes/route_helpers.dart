import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

GoRoute simpleRoute(String path, Widget screen) {
  return GoRoute(path: path, builder: (_, _) => screen);
}
