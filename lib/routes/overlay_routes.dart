import 'package:go_router/go_router.dart';
import 'package:messenger/features/channels/presentation/screens/new_channel_screen.dart';
import 'package:messenger/features/common/presentation/screens/share_screen.dart';
import 'package:messenger/features/common/presentation/screens/telegram_features_screen.dart';
import 'package:messenger/features/groups/presentation/screens/new_group_screen.dart';
import 'package:messenger/features/nearby/presentation/screens/people_nearby_screen.dart';
import 'package:messenger/features/saved_messages/presentation/screens/saved_messages_screen.dart';
import 'package:messenger/routes/named_routes.dart';

final List<RouteBase> overlayRoutes = [
  GoRoute(
    path: NamedRoutes.peopleNearby,
    builder: (_, _) => const PeopleNearbyScreen(),
  ),
  GoRoute(
    path: NamedRoutes.newGroup,
    builder: (_, _) => const NewGroupScreen(),
  ),
  GoRoute(
    path: NamedRoutes.newChannel,
    builder: (_, _) => const NewChannelScreen(),
  ),
  GoRoute(
    path: NamedRoutes.savedMessages,
    builder: (_, _) => const SavedMessagesScreen(),
  ),
  GoRoute(
    path: NamedRoutes.telegramFeatures,
    builder: (_, _) => const TelegramFeaturesScreen(),
  ),
  GoRoute(path: NamedRoutes.share, builder: (_, _) => const ShareScreen()),
];
