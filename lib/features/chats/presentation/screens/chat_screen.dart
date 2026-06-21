import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/shared/widgets/custom_drawer.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = [
      {
        "name": "Saved Messages",
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
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff229ED9),
        onPressed: () {},
        child: const Icon(Icons.mode_edit_outline_rounded, color: Colors.white),
      ),

      /* appBar: CustomAppBar(
        title: 'Telegram',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ), */
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      /* SizedBox(
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
                      ), */
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu_rounded),
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
                ),

                const SizedBox(height: 12),

                SizedBox(
                  height: 88,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: SizedBox(
                          width: 60,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xff229ED9),
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor:
                                      Colors.primaries[index %
                                          Colors.primaries.length],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                index == 0 ? 'You' : 'User',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 42,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    children: [
                      _tab("All", true),
                      _tab("Groups", false),
                      _tab("Work", false),
                      _tab("Bots", false),
                    ],
                  ),
                ),

                const Divider(height: 1),

                Expanded(
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];

                      return InkWell(
                        onTap: () {
                          context.push('/messages', extra: chat['name']);
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
            Container(
              width: 24,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xff229ED9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    );
  }
}
