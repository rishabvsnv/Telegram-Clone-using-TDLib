import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/shared/widgets/custom_appbar.dart';

class ArchiveScreen extends ConsumerWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = [
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
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff229ED9),
        onPressed: () {},
        child: const Icon(Icons.mode_edit_outline_rounded, color: Colors.white),
      ),

      appBar: CustomAppBar(
        title: 'Archived',
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [PopupMenuItem(child: Text('Archive Setting'))];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return ListView.builder(
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
