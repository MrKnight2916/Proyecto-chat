class Message {
  final String text;
  final String imageUrl;
  final bool isGif;
  final bool isUser;

  Message({
    required this.text,
    required this.imageUrl,
    this.isGif = false,
    this.isUser = true,
  });
}