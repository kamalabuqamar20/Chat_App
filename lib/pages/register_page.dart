import 'package:chat_app/constant.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
   static const String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    String email='';

   String password='';

   bool isLoading = false;

   bool obscureText = true;

   GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor:kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 80,),
                Image.asset(kLogoApp),
                const SizedBox(height: 20,),
              const  Text('Scholer Chat',style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'Pacifico'),),
              const SizedBox(height: 40,),
              const Row(
                children: [
                    Text('Register',style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'Pacifico'),),
                ],
              ),
              const SizedBox(height: 10,),
               CustomTextField(
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email',onChanged: (data){
                email=data;
               },),
              const SizedBox(height: 10,),
               CustomTextField(keyboardType: TextInputType.phone,labelText: 'Password',onChanged: (data){
                password=data;
               },
               obscureText: obscureText,
               icon: IconButton(onPressed: (){
                obscureText=!obscureText;
                setState(() {
                  
                });
               }, icon: obscureText ==true? const Icon(Icons.visibility,color: Colors.white,):const Icon(Icons.visibility_off,color: Colors.white,)
               ),),
              const SizedBox(height: 25,),
               CustomButton(
                 buttonName: 'Register',
                 onTap: ()async {
                  if (formKey.currentState!.validate()){
                    isLoading = true;
                      setState(() {
                        
                      });
                  try {
                      await RegisterUser();
                      Navigator.of(context).pushNamed(ChatPage.id,arguments: email);
                      
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ShowSnackBar(context,'weak password');
                      } else if (e.code == 'email-already-in-use') {
                       ShowSnackBar(context, 'email already exists');
                      }
                    } catch (e) {
                      ShowSnackBar(context, 'there was an error');
                    }
                    isLoading = false;
                    setState(() {
                      
                    });
                    }
                    
                 },
                 ),
              const SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                // Text('don‘t have an account? '),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child:const Text('Login',style: TextStyle(color: Color(0xffC7EDE6),),)),
              ],),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
  Future<void> RegisterUser() async {
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}