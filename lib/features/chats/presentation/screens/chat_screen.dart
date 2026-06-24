import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/routes/named_routes.dart';
import 'package:messenger/shared/widgets/custom_appbar.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  int selectedTab = 0;

  final tabs = ['All', 'Unread', 'Groups', 'Work', 'Bots'];

  final chats = [
    {
      "name": "Saved Messages",
      "type": "All",
      "message": "IMG_420.png",
      "time": "Fri",
      "unread": 0,
      "color": Colors.blue,
      "read": true,
      "muted": false,
      "pinned": true,
    },
    {
      "name": "Emma Torreaux",
      "type": "Work",
      "message": "Bob says hi.",
      "time": "9:41",
      "unread": 0,
      "color": Colors.orange,
      "read": true,
      "muted": false,
      "pinned": false,
    },
    {
      "name": "Roberto",
      "type": "Work",
      "message": "Say hello to Emma.",
      "time": "9:41",
      "unread": 1,
      "color": Colors.green,
      "read": false,
      "muted": false,
      "pinned": false,
    },
    {
      "name": "8Bit Times",
      "type": "Groups",
      "message": "8Bit Times started a Live Stream",
      "time": "9:41",
      "unread": 4,
      "color": Colors.red,
      "read": false,
      "muted": true,
      "pinned": false,
    },
    {
      "name": "Digital Nomads",
      "type": "Groups",
      "message": "Jennie: We just reached 2,500 members",
      "time": "9:22",
      "unread": 12,
      "color": Colors.teal,
      "read": false,
      "muted": true,
      "pinned": true,
    },
    {
      "name": "Penelope",
      "message": "See you tomorrow 👋",
      "time": "9:12",
      "unread": 0,
      "color": Colors.purple,
      "read": true,
      "muted": false,
      "pinned": false,
    },
    {
      "name": "ChatGPT Bots",
      "type": "Bots",
      "message": "See you tomorrow 👋",
      "time": "9:12",
      "unread": 0,
      "color": Colors.purple,
      "read": true,
      "muted": false,
      "pinned": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredChats = selectedTab == 0
        ? chats
        : chats.where((chat) {
            return chat["type"] == tabs[selectedTab];
          }).toList();
    filteredChats.sort((a, b) {
      final aPinned = a["pinned"] as bool;
      final bPinned = b["pinned"] as bool;

      if (aPinned == bPinned) return 0;

      return aPinned ? -1 : 1;
    });
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        heroTag: 'chat_fab',
        backgroundColor: const Color(0xff229ED9),
        onPressed: () {},
        child: const Icon(Icons.mode_edit_outline_rounded, color: Colors.white),
      ),

      appBar: CustomAppBar(
        isDashboard: true,
        title: 'Telegram',
        customTitle: Row(
          children: [
            SizedBox(
              width: 54,
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.orange,
                  ),
                  Positioned(
                    left: 18,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.purple.shade200,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Telegram",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xff229ED9),
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.dark_mode_outlined),
                    Text('Night Mode'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'message',
                child: Row(
                  children: [Icon(Icons.people_outlined), Text('New Group')],
                ),
              ),
              PopupMenuItem(
                value: 'remove',
                child: Row(
                  children: [
                    Icon(Icons.bookmark_outline),
                    Text('Saved Messages'),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                /* Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 54,
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.orange,
                            ),
                            Positioned(
                              left: 18,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.purple.shade200,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Text(
                        "Telegram",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff229ED9),
                        ),
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ), */
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.all(16),
                    child: ListTile(
                      dense: true,
                      title: Text('Add your birthday! 🎂'),
                      subtitle: Text(
                        'Let your contacts know when you\'re celebrating',
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 42,
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                          tabs.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = index;
                              });
                            },
                            child: _tab(tabs[index], selectedTab == index),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(height: 1),

                Expanded(
                  child: ListView.builder(
                    itemCount: filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = filteredChats[index];

                      return InkWell(
                        onLongPress: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return Wrap(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.push_pin),
                                    title: Text("Pin Chat"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.notifications_off),
                                    title: Text("Mute"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.archive),
                                    title: Text("Archive"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onTap: () {
                          context.push(
                            '${NamedRoutes.chats}/$index',
                            extra: chat['name'],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: chat["color"] as Color,
                                child: Text(
                                  chat["name"]
                                      .toString()
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            chat["name"].toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),

                                        if (chat["pinned"] as bool)
                                          const Padding(
                                            padding: EdgeInsets.only(right: 4),
                                            child: Icon(
                                              Icons.push_pin_rounded,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                          ),

                                        Text(
                                          chat["time"].toString(),
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 4),

                                    Row(
                                      children: [
                                        Icon(
                                          (chat["read"] as bool)
                                              ? Icons.done_all
                                              : Icons.done,
                                          size: 16,
                                          color: const Color(0xff229ED9),
                                        ),

                                        const SizedBox(width: 4),

                                        Expanded(
                                          child: Text(
                                            chat["message"].toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ),

                                        if (chat["muted"] as bool)
                                          const Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Icon(
                                              Icons.volume_off_outlined,
                                              size: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              if ((chat["unread"] as int) > 0)
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xff229ED9),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    chat["unread"].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static Widget _tab(String title, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: selected ? const Color(0xff229ED9) : Colors.grey.shade700,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          if (selected)
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: selected ? 24 : 0,
              height: 3,
            ),
        ],
      ),
    );
  }
}
