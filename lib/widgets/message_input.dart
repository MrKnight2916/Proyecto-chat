import 'package:flutter/material.dart';
import 'send_button.dart';
import '../styles/styles.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInput({super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: controller,
                decoration: AppStyles.inputDecoration.copyWith(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                maxLines: null, // Permite múltiples líneas
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    onSend();
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          SendButton(onPressed: onSend),
        ],
      ),
    );
  }
}