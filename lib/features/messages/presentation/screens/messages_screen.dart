import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/shared/widgets/custom_appbar.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key, required chatId});

  @override
  Widget build(BuildContext context) {
    final messages = [
      const SavedMessage(
        text: 'Flutter Riverpod architecture notes',
        time: '10:24 AM',
      ),
      const SavedMessage(
        text: 'Remember to implement chat pagination.',
        time: 'Yesterday',
        isSender: true,
      ),
      const SavedMessage(text: 'https://flutter.dev', time: 'Yesterday'),
      const SavedMessage(
        text: 'Telegram clone feature checklist.',
        time: 'Monday',
      ),
      const SavedMessage(text: 'UI inspiration screenshots.', time: 'Jun 15'),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Emma Torreaux',
        customTitle: GestureDetector(
          onLongPress: () {
            context.pop();
          },
          child: Text('Emma Torreaux'),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('data')),
                PopupMenuItem(child: Text('data')),
              ];
            },
          ),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 8.0, bottom: 8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Message',
            fillColor: Colors.white,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.emoji_emotions_outlined),
            ),
            suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            // fillColor: Colors.blueGrey,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: messages.length,
        separatorBuilder: (_, _) => const SizedBox(height: 4),
        itemBuilder: (context, index) {
          final message = messages[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: message.isSender
                  ? Row(
                      children: [
                        Spacer(),
                        Card(
                          color: Colors.greenAccent,
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.text,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(height: 6),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    message.time,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.text,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(height: 6),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    message.time,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

class SavedMessage {
  final String text;
  final String time;
  final bool isSender;

  const SavedMessage({
    required this.text,
    required this.time,
    this.isSender = false,
  });
}
