import 'package:flutter/material.dart';
import '../styles/styles.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String imageUrl;
  final bool isGif;
  final bool isUser;

  const ChatMessage({
    super.key,
    required this.text,
    required this.imageUrl,
    this.isGif = false,
    this.isUser = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: text.isNotEmpty ? AppStyles.messagePadding : EdgeInsets.zero,
        decoration: isUser
            ? AppStyles.userMessageBoxDecoration
            : AppStyles.receivedMessageBoxDecoration,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Image not available');
                    },
                  ),
                ),
              ),
            if (text.isNotEmpty)
              Padding(
                padding: imageUrl.isNotEmpty
                    ? const EdgeInsets.only(top: 8.0)
                    : EdgeInsets.zero,
                child: Text(
                  text,
                  style: AppStyles.messageTextStyle,
                  textDirection: TextDirection.ltr, // This line ensures LTR direction
                ),
              ),
          ],
        ),
      ),
    );
  }
}
