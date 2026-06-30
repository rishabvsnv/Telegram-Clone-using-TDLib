import 'package:go_router/go_router.dart';
import 'package:messenger/routes/routes_export.dart';
import 'package:messenger/routes/named_routes.dart';

StatefulShellBranch chatBranch() {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        path: NamedRoutes.chats,
        builder: (_, _) => const ChatScreen(),
        routes: [
          GoRoute(
            path: ':chatId', // relative
            builder: (context, state) {
              return MessageInfoScreen(
                chatId: state.pathParameters['chatId']!,
                userName: state.extra as String,
              );
            },
          ),
        ],
      ),
    ],
  );
}
