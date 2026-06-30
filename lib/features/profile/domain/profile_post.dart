class ProfilePost {
  final String text;
  final bool hasPhoto;
  final bool hasVideo;

  const ProfilePost({
    required this.text,
    this.hasPhoto = false,
    this.hasVideo = false,
  });
}
