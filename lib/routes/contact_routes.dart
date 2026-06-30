import 'package:go_router/go_router.dart';
import 'package:messenger/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:messenger/routes/named_routes.dart';

StatefulShellBranch contactsBranch() {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        path: NamedRoutes.contacts,
        builder: (_, _) => const ContactsScreen(),
      ),
    ],
  );
}
