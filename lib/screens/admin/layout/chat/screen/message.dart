import 'dart:convert';

import 'package:adminease/models/employee.dart';
import 'package:adminease/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:flutter_chat_ui/flutter_chat_ui.dart';


class ChatMessage extends StatefulWidget {
  static const String routeName = '/chat-message';
  final Employee employee;
  const ChatMessage({super.key, required this.employee});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );



  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  
 
 
 

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "id",
      text: message.text,
    );

    _addMessage(textMessage);
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          header(context, title: widget.employee.name, back: true, settings: true),
           Expanded(child: 
           Chat(
            
          messages: _messages,
          inputOptions: InputOptions(
            
          ),
          
           onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
        ),)
      
        ],
      )),
    );
  }
}