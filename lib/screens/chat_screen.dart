import 'package:flutter/material.dart';
import '../widgets/chat_message.dart';
import '../widgets/message_input.dart';
import '../models/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _initialMessages = [
    Message(text: 'Hey, que tal?', imageUrl: '', isUser: true),
    Message(text: 'Todo bien, y tu?', imageUrl: '', isUser: false),
    Message(
      text: 'Bien miop',
      imageUrl: 'https://cdn.discordapp.com/attachments/1055166104026218526/1128191921781747722/359703839_200149569689661_5062454317421431048_n.png?ex=6661edda&is=66609c5a&hm=563d6ef306b574015280ef81cf9f7a22373c2637d2915998aedbe81c485d5e57&',
      isUser: true
    ),
    Message(text: 'En que estas?', imageUrl: '', isUser: false),
    Message(text: 'Haciendo la tarea', imageUrl: '', isUser: true),
    Message(text: 'Pudiste Resolver el problema?', imageUrl: '', isUser: false),
    Message(text: 'No compay, llevo todo el dia en eso y me sigue dando error', imageUrl: '', isUser: true),
    Message(
      text: 'Somos 2...',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM8vtgK-ahSii0SuG2K5IZkjzNyPCiMzz0QQ&s',
      isUser: false
    ),
    Message(text: 'Yo como que voy a entregar eso asi, se hizo lo que se pudo', imageUrl: '', isUser: true),
    Message(text: 'Yo seguire intentando a ver si logro algo', imageUrl: '', isUser: false),
    Message(text: 'Dale, me dejas saber si lo lograste', imageUrl: '', isUser: true),
    Message(
      text: 'Tato pp',
      imageUrl: 'https://pbs.twimg.com/media/GIczhs7WsAE8rak.jpg:large',
      isUser: false
    ),
  ];

  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _generateMessages();
  }

  void _generateMessages() {
    while (_messages.length < 110) {
      for (var message in _initialMessages) {
        if (_messages.length >= 110) break;
        _messages.add(message);
      }
    }
  }

  void _handleSend() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(Message(
          text: _controller.text,
          imageUrl: '',
          isUser: true,
        ));
        _controller.clear();
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToEnd();
      });
    }
  }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shiryu'),
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://pbs.twimg.com/media/EidtTVCX0AEX0RQ.jpg:large',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Acción para el botón de videollamada
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Acción para el botón de llamada
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Acción para el botón de más opciones
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.network(
              'https://media.istockphoto.com/id/1409540606/es/vector/vector-de-entrarnos-en-contacto-con-patr%C3%B3n-entrarnos-en-contacto-con-fondo-transparente.jpg?s=612x612&w=0&k=20&c=5zg7sKC_9MfdudJVkhUCwwWuNOG6d22Sa5_vLeuxRoY=',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return ChatMessage(
                      text: message.text,
                      imageUrl: message.imageUrl,
                      isGif: message.isGif,
                      isUser: message.isUser,
                    );
                  },
                ),
              ),
              MessageInput(controller: _controller, onSend: _handleSend),
            ],
          ),
        ],
      ),
    );
  }
}
