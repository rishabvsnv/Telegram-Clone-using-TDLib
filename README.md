# Telegram Clone

A modern Telegram-inspired messaging application built with **Flutter**, powered by **TDLib**, and designed using **Clean Architecture**, **Riverpod**, and **Material 3**.

---

## 📱 Overview

Telegram Clone aims to provide a fast, secure, and scalable messaging experience similar to Telegram while maintaining a clean codebase and modern Flutter development practices.

The application leverages Telegram's official **TDLib (Telegram Database Library)** for real-time messaging, synchronization, authentication, media handling, and other Telegram functionalities.

---

## ✨ Features

### Authentication

- Phone number login
- OTP verification
- Session management
- Logout support

### Chats

- Private chats
- Group chats
- Channel support
- Message reactions
- Reply messages
- Forward messages
- Pinned messages
- Draft messages

### Messaging

- Text messages
- Image messages
- Video messages
- Audio messages
- Voice notes
- Document sharing
- Stickers
- GIF support

### Media

- Media gallery
- File downloads
- File uploads
- Media preview

### User Management

- User profiles
- Profile photo management
- Online status
- Last seen information
- Username support

### Contacts

- Contact synchronization
- Search contacts
- Invite contacts

### Groups & Channels

- Create groups
- Create channels
- Manage members
- Manage administrators
- Ban users
- Mute users

### Notifications

- Push notifications
- Message notifications
- Group notifications
- Channel notifications

### Settings

- Appearance settings
- Privacy settings
- Notification settings
- Data & storage settings
- Language settings

---

## 🏗 Architecture

The project follows **Clean Architecture** principles.

```text
lib/
├── app/
│   ├── router/
│   ├── theme/
│   └── providers/
│
├── core/
│   ├── constants/
│   ├── exceptions/
│   ├── extensions/
│   ├── network/
│   ├── services/
│   ├── utils/
│   └── tdlib/
│
├── features/
│   ├── auth/
│   ├── chats/
│   ├── contacts/
│   ├── calls/
│   ├── groups/
│   ├── channels/
│   ├── profile/
│   ├── settings/
│   └── search/
│
├── shared/
│   ├── widgets/
│   ├── models/
│   └── providers/
│
└── main.dart
```

### Layer Structure

Each feature follows:

```text
feature/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
└── presentation/
    ├── screens/
    ├── widgets/
    └── providers/
```

---

## 🛠 Tech Stack

### Framework

- Flutter

### State Management

- Riverpod

### Navigation

- GoRouter

### Backend

- Telegram TDLib

### Local Storage

- Hive
- SharedPreferences

### Dependency Injection

- Riverpod Providers

### Networking

- TDLib API

### UI

- Material 3

---

## 📦 Dependencies

```yaml
flutter_riverpod
go_router
freezed
freezed_annotation
json_annotation
hive
hive_flutter
shared_preferences
equatable
intl
cached_network_image
flutter_svg
permission_handler
image_picker
path_provider
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Dart SDK
- Android Studio / VS Code
- Telegram API ID
- Telegram API Hash
- TDLib binaries

---

## Clone Repository

```bash
git clone https://github.com/rishabvsnv/Telegram-Clone-using-TDLib.git

cd telegram-clone
```

---

## Install Dependencies

```bash
flutter pub get
```

---

## Configure TDLib

Obtain your Telegram API credentials:

- API ID
- API Hash

Create a configuration file:

```dart
class TelegramConfig {
  static const int apiId = YOUR_API_ID;
  static const String apiHash = 'YOUR_API_HASH';
}
```

---

## Run Code Generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Run Application

```bash
flutter run
```

---

## 📂 Environment Setup

### Android

Add Internet permission:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

Additional permissions:

```xml
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
<uses-permission android:name="android.permission.READ_MEDIA_VIDEO"/>
<uses-permission android:name="android.permission.RECORD_AUDIO"/>
<uses-permission android:name="android.permission.CAMERA"/>
```

---

### iOS

Add required permissions in:

```text
ios/Runner/Info.plist
```

Examples:

```xml
NSCameraUsageDescription
NSMicrophoneUsageDescription
NSPhotoLibraryUsageDescription
```

---

## 🔒 Security

- Secure session handling
- Telegram authentication
- Local data encryption
- Secure media storage
- Privacy-first architecture

---

## 🧪 Testing

Run all tests:

```bash
flutter test
```

Run integration tests:

```bash
flutter test integration_test
```

---

## 📈 Project Status

### MVP

- [x] Authentication
- [x] User profiles
- [x] Chat list
- [x] Private messaging
- [x] Media messaging
- [x] Group chats
- [x] Search
- [x] Settings

### Future Releases

- [ ] Voice calls
- [ ] Video calls
- [ ] Stories
- [ ] Bots
- [ ] Mini Apps
- [ ] Live streaming
- [ ] End-to-end secret chats
- [ ] Multi-account support

---

## 🤝 Contributing

Contributions are welcome.

1. Fork the repository
2. Create a feature branch

```bash
git checkout -b feature/new-feature
```

3. Commit changes

```bash
git commit -m "Add new feature"
```

4. Push branch

```bash
git push origin feature/new-feature
```

5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License.

---

## ⚠ Disclaimer

This project is an independent educational implementation inspired by Telegram.

Telegram®, TDLib, and related trademarks belong to their respective owners. This project is not affiliated with, endorsed by, or sponsored by Telegram Messenger LLP.

---

## 👨‍💻 Author

Developed with Flutter and TDLib.

If you find this project useful, consider giving it a ⭐ on GitHub.
