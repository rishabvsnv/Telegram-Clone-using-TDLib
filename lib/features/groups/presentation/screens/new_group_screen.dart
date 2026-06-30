import 'package:flutter/material.dart';
import 'package:messenger/features/groups/domain/contact_model.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  final List<ContactModel> _contacts = const [
    ContactModel(id: '1', name: 'John Doe'),
    ContactModel(id: '2', name: 'Emma Wilson'),
    ContactModel(id: '3', name: 'Michael Smith'),
    ContactModel(id: '4', name: 'Sophia Brown'),
    ContactModel(id: '5', name: 'Alex Johnson'),
    ContactModel(id: '6', name: 'Olivia Taylor'),
    ContactModel(id: '7', name: 'Daniel Thomas'),
  ];

  final Set<String> _selectedUsers = {};

  void _toggleSelection(String id) {
    setState(() {
      if (_selectedUsers.contains(id)) {
        _selectedUsers.remove(id);
      } else {
        _selectedUsers.add(id);
      }
    });
  }

  ContactModel _getUser(String id) {
    return _contacts.firstWhere((e) => e.id == id);
  }

  @override
  Widget build(BuildContext context) {
    final hasSelection = _selectedUsers.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          hasSelection ? '${_selectedUsers.length} selected' : 'New Group',
        ),
      ),

      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: hasSelection ? 1 : 0.4,
        child: FloatingActionButton(
          onPressed: hasSelection ? () {} : null,
          child: const Icon(Icons.arrow_forward),
        ),
      ),

      body: Column(
        children: [
          /// ✅ Selected users strip (Telegram style)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: hasSelection ? 90 : 0,
            child: hasSelection
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedUsers.length,
                    itemBuilder: (context, index) {
                      final id = _selectedUsers.elementAt(index);
                      final user = _getUser(id);

                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  child: Text(user.name[0]),
                                ),
                                Positioned(
                                  right: -4,
                                  top: -4,
                                  child: GestureDetector(
                                    onTap: () => _toggleSelection(user.id),
                                    child: const CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.red,
                                      child: Icon(
                                        Icons.close,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: 60,
                              child: Text(
                                user.name,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),
          ),

          /// 👇 Contact list
          Expanded(
            child: ListView.separated(
              itemCount: _contacts.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                final isSelected = _selectedUsers.contains(contact.id);

                return InkWell(
                  onTap: () => _toggleSelection(contact.id),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    color: isSelected
                        ? Colors.blue.withValues(alpha: 0.08)
                        : Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              child: Text(contact.name[0]),
                            ),

                            /// selection indicator
                            if (isSelected)
                              const Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.check,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            contact.name,
                            style: const TextStyle(fontSize: 16),
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
      ),
    );
  }
}
