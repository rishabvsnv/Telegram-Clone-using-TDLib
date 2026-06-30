import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/routes/auth_routes.dart';
import 'package:messenger/routes/named_routes.dart';
import 'package:messenger/routes/overlay_routes.dart';
import 'package:messenger/routes/shell_routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: NamedRoutes.chats,
    routes: [shellRoute(), ...authRoutes, ...overlayRoutes],
  );
});
