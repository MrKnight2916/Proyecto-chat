import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle messageTextStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontFamily: 'Roboto',
  );

  static const BoxDecoration userMessageBoxDecoration = BoxDecoration(
    color: Color(0xFFE1FFC7),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.0),
      topRight: Radius.circular(15.0),
      bottomLeft: Radius.circular(15.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  );

  static const BoxDecoration receivedMessageBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.0),
      topRight: Radius.circular(15.0),
      bottomRight: Radius.circular(15.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  );

  static const InputDecoration inputDecoration = InputDecoration(
    hintText: 'Escribe un mensaje...',
    border: InputBorder.none,
  );

  static const EdgeInsets messagePadding = EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0);
}
