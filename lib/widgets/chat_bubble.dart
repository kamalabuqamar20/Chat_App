import 'package:chat_app/constant.dart';

import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
   required this.messageModel
  });
 final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
       
        margin:const EdgeInsets.all(12),
        padding:const EdgeInsets.all(15),
        decoration:const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight:Radius.circular(16),
            bottomRight:Radius.circular(16),  
          )
        ),
        child: Text(messageModel.message,style:const TextStyle(color: Colors.white),),
      ),
    );
  }
}


class ChatBubbleForOntherUser extends StatelessWidget {
  const ChatBubbleForOntherUser({
    super.key,
   required this.messageModel
  });
 final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
       
        margin:const EdgeInsets.all(12),
        padding:const EdgeInsets.all(15),
        decoration:const BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight:Radius.circular(16),
            bottomLeft:Radius.circular(16),  
          )
        ),
        child: Text(messageModel.message,style:const TextStyle(color: Colors.white),),
      ),
    );
  }
}