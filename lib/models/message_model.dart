import 'package:chat_app/constant.dart';

class MessageModel{
  final String message;
  final String email;


 const MessageModel({required this.message,required this.email});
 factory MessageModel.fromJson(jsonData){
  return MessageModel(message: jsonData[kMessage],email: jsonData[kEmailId]);
 }
}