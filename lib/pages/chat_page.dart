import 'package:chat_app/constant.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
 static const String id = 'ChatPage';  

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
 final CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);

 final TextEditingController controller = TextEditingController();

 final ScrollController _controllerScroll = ScrollController();

  String dataFromSub='';

  @override
  Widget build(BuildContext context) {
  var emailId= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreateAt).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child:  Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
         List listMessage =  [];

        for (int i = 0 ;i< snapshot.data!.docs.length;i++) {
          listMessage.add(MessageModel.fromJson(snapshot.data!.docs[i]));
        }
        return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogoApp,width: 50,),
           const SizedBox(width: 10,),
           const Text('Chat',style: TextStyle(fontFamily: 'Pacifico'),)
          ],
        ),
      ),
      body:Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              controller: _controllerScroll,
              physics:const BouncingScrollPhysics(),
              child: ListView.builder(
                
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount: listMessage.length,
                itemBuilder: (context, index) {
                  return listMessage[index].email ==emailId?  ChatBubble(messageModel:listMessage[index]):ChatBubbleForOntherUser(messageModel: listMessage[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: controller,
              onChanged: (data){
                 dataFromSub =data;
                
              },
              onSubmitted: (data) {
               
                messages.add({
                kMessage:data,
                kCreateAt:DateTime.now(),
                kEmailId:emailId,
                });

                 controller.clear();
                 _controllerScroll.animateTo(_controllerScroll.position.minScrollExtent, duration:const Duration(milliseconds: 500), curve: Curves.easeIn);
              
               
              
              },
             
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  messages.add({
                kMessage:dataFromSub,
                kCreateAt:DateTime.now(),
                kEmailId:emailId,
                });
                 controller.clear();
                 _controllerScroll.animateTo(_controllerScroll.position.minScrollExtent, duration:const Duration(milliseconds: 500), curve: Curves.easeIn);
                },icon:const Icon(Icons.send,color: kPrimaryColor,),),
                hintText: 'Send Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:const BorderSide(
                    color: kPrimaryColor,
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
      },
    );
  }
}

////////////////////////////////////////////////////////////
