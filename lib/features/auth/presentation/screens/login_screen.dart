import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/routes/named_routes.dart';
import 'package:messenger/shared/widgets/custom_appbar.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _countryCodeFocusNode = FocusNode();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _countryCodeController = TextEditingController(
    text: '+91',
  );

  String _selectedCountry = 'in';

  bool sendMessages = false;

  final Map<String, String> countryCodes = {
    'in': '+91',
    'us': '+1',
    'uk': '+44',
    'ca': '+1',
    'au': '+61',
    'nz': '+64',
    'de': '+49',
    'fr': '+33',
    'it': '+39',
    'es': '+34',
    'ru': '+7',
    'cn': '+86',
    'jp': '+81',
    'kr': '+82',
    'sg': '+65',
    'my': '+60',
    'th': '+66',
    'id': '+62',
    'ae': '+971',
    'sa': '+966',
    'qa': '+974',
    'kw': '+965',
    'om': '+968',
    'bh': '+973',
    'pk': '+92',
    'bd': '+880',
    'lk': '+94',
    'np': '+977',
  };

  final List<Map<String, String?>> keypadKeys = [
    {'title': '1', 'subtitle': null},
    {'title': '2', 'subtitle': 'ABC'},
    {'title': '3', 'subtitle': 'DEF'},
    {'title': '4', 'subtitle': 'GHI'},
    {'title': '5', 'subtitle': 'JKL'},
    {'title': '6', 'subtitle': 'MNO'},
    {'title': '7', 'subtitle': 'PQRS'},
    {'title': '8', 'subtitle': 'TUV'},
    {'title': '9', 'subtitle': 'WXYZ'},
    {'title': '', 'subtitle': null},
    {'title': '0', 'subtitle': '+'},
    {'title': 'BACKSPACE', 'subtitle': null},
  ];

  @override
  void initState() {
    super.initState();

    _countryCodeController.text = '+91';

    _countryCodeController.addListener(_onCountryCodeChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _phoneFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onCountryCodeChanged() {
    final code = _countryCodeController.text.trim();

    final match = countryCodes.entries.where((e) => e.value == code);

    if (match.isNotEmpty) {
      final country = match.first.key;

      if (_selectedCountry != country) {
        setState(() {
          _selectedCountry = country;
        });
      }
    }
  }

  void _onKeyPressed(String key) {
    final controller = _countryCodeFocusNode.hasFocus
        ? _countryCodeController
        : _phoneController;

    if (key == 'BACKSPACE') {
      if (controller.text.isNotEmpty) {
        controller.text = controller.text.substring(
          0,
          controller.text.length - 1,
        );
      }
    } else if (key == 'LongPress') {
      controller.clear();
    } else {
      controller.text += key;
    }

    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  void _showProxySheet() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: SwitchListTile(
                  value: sendMessages,
                  title: const Text('Use Proxy'),
                  onChanged: (value) {
                    setState(() {
                      sendMessages = value;
                    });
                    Navigator.pop(context);
                    _showProxySheet();
                  },
                ),
              ),

              const _SectionHeader(title: 'Connections'),

              ListTile(
                title: const Text('Add Proxy'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: SwitchListTile(
                  value: sendMessages,
                  title: const Text('Use Proxy for Calls'),
                  onChanged: (value) {
                    setState(() {
                      sendMessages = value;
                    });
                    Navigator.pop(context);
                    _showProxySheet();
                  },
                ),
              ),

              const _SectionHeader(
                title: 'Proxy servers may degrade the quality of your calls.',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isSmallScreen = size.height < 700;

    final keypadHeight = isSmallScreen ? 260.0 : size.height * 0.38;

    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        actions: [
          IconButton(
            onPressed: _showProxySheet,
            icon: const Icon(Icons.shield_outlined),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height * 0.40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your phone number',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Please confirm your country code\nand enter your phone number.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),

                const SizedBox(height: 32),

                DropdownButtonFormField<String>(
                  initialValue: _selectedCountry,
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'in', child: Text('🇮🇳 India')),
                    DropdownMenuItem(
                      value: 'us',
                      child: Text('🇺🇸 United States'),
                    ),
                    DropdownMenuItem(
                      value: 'uk',
                      child: Text('🇬🇧 United Kingdom'),
                    ),
                    DropdownMenuItem(value: 'ca', child: Text('🇨🇦 Canada')),
                    DropdownMenuItem(
                      value: 'au',
                      child: Text('🇦🇺 Australia'),
                    ),
                    DropdownMenuItem(
                      value: 'nz',
                      child: Text('🇳🇿 New Zealand'),
                    ),
                    DropdownMenuItem(value: 'de', child: Text('🇩🇪 Germany')),
                    DropdownMenuItem(value: 'fr', child: Text('🇫🇷 France')),
                    DropdownMenuItem(value: 'it', child: Text('🇮🇹 Italy')),
                    DropdownMenuItem(value: 'es', child: Text('🇪🇸 Spain')),
                    DropdownMenuItem(value: 'ru', child: Text('🇷🇺 Russia')),
                    DropdownMenuItem(value: 'cn', child: Text('🇨🇳 China')),
                    DropdownMenuItem(value: 'jp', child: Text('🇯🇵 Japan')),
                    DropdownMenuItem(
                      value: 'kr',
                      child: Text('🇰🇷 South Korea'),
                    ),
                    DropdownMenuItem(
                      value: 'sg',
                      child: Text('🇸🇬 Singapore'),
                    ),
                    DropdownMenuItem(value: 'my', child: Text('🇲🇾 Malaysia')),
                    DropdownMenuItem(value: 'th', child: Text('🇹🇭 Thailand')),
                    DropdownMenuItem(
                      value: 'id',
                      child: Text('🇮🇩 Indonesia'),
                    ),
                    DropdownMenuItem(value: 'ae', child: Text('🇦🇪 UAE')),
                    DropdownMenuItem(
                      value: 'sa',
                      child: Text('🇸🇦 Saudi Arabia'),
                    ),
                    DropdownMenuItem(value: 'qa', child: Text('🇶🇦 Qatar')),
                    DropdownMenuItem(value: 'kw', child: Text('🇰🇼 Kuwait')),
                    DropdownMenuItem(value: 'om', child: Text('🇴🇲 Oman')),
                    DropdownMenuItem(value: 'bh', child: Text('🇧🇭 Bahrain')),
                    DropdownMenuItem(value: 'pk', child: Text('🇵🇰 Pakistan')),
                    DropdownMenuItem(
                      value: 'bd',
                      child: Text('🇧🇩 Bangladesh'),
                    ),
                    DropdownMenuItem(
                      value: 'lk',
                      child: Text('🇱🇰 Sri Lanka'),
                    ),
                    DropdownMenuItem(value: 'np', child: Text('🇳🇵 Nepal')),
                  ],
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      _selectedCountry = value;
                      _countryCodeController.text = countryCodes[value]!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: TextFormField(
                          controller: _countryCodeController,
                          focusNode: _countryCodeFocusNode,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.none,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                            hintText: '+91',
                          ),
                        ),
                      ),

                      Container(
                        width: 1,
                        height: 32,
                        color: Colors.grey.shade300,
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          focusNode: _phoneFocusNode,
                          keyboardType: TextInputType.none,
                          decoration: const InputDecoration(
                            hintText: 'Phone number',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: SizedBox(
          height: keypadHeight,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: keypadKeys.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: isSmallScreen ? 1.7 : 2.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = keypadKeys[index];

                if (item['title']!.isEmpty) {
                  return const SizedBox.shrink();
                }

                if (item['title'] == 'BACKSPACE') {
                  return GestureDetector(
                    onTap: () => _onKeyPressed('BACKSPACE'),
                    onLongPress: () => _onKeyPressed('LongPress'),
                    child: const Card(
                      child: Center(child: Icon(Icons.backspace_outlined)),
                    ),
                  );
                }

                return DialPadWidget(
                  title: item['title']!,
                  subtitle: item['subtitle'],
                  onTap: () {
                    _onKeyPressed(item['title']!);
                  },
                );
              },
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(NamedRoutes.chats);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class DialPadWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const DialPadWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: width < 360 ? 16 : 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(fontSize: width < 360 ? 10 : 12),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
