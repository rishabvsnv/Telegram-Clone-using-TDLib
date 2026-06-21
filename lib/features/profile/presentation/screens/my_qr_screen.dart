import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrScreen extends StatelessWidget {
  const MyQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Todo: Replace with actual user data from Riverpod/Auth Provider
    const String fullName = 'Rishabh';
    const String username = 'rishabvsnv';
    const String phoneNumber = '+91 9876543210';

    final qrData = 'https://t.me/$username';

    return Scaffold(
      appBar: AppBar(title: const Text('My QR Code')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              const CircleAvatar(
                radius: 48,
                child: Icon(Icons.person, size: 50),
              ),

              const SizedBox(height: 16),

              Text(
                fullName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text('@$username', style: Theme.of(context).textTheme.bodyLarge),

              const SizedBox(height: 4),

              Text(
                phoneNumber,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),

              const SizedBox(height: 32),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      QrImageView(
                        data: qrData,
                        version: QrVersions.auto,
                        size: 260,
                        gapless: true,
                      ),

                      const SizedBox(height: 20),

                      Text(
                        'Scan this QR code to open my profile',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.link, size: 32),
                    const SizedBox(height: 12),
                    SelectableText(
                      qrData,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    // Todo:
                    // Share profile link
                  },
                  icon: const Icon(Icons.share),
                  label: const Text('Share Profile'),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Todo:
                    // Save QR image
                  },
                  icon: const Icon(Icons.download),
                  label: const Text('Save QR Code'),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
