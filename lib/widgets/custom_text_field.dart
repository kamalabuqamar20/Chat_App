
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.icon,
    this.obscureText=false,
    required this.keyboardType
  });
  final String labelText;
  final  Function(String data) onChanged;
  final Widget? icon;
  final bool obscureText;
  final TextInputType keyboardType ;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: ( value){
        if (value!.isEmpty){
          return 'failed is required';
        }
        return null;
      },
      keyboardType: keyboardType,
      
      onChanged: onChanged,
      
      obscureText: obscureText,
       decoration: InputDecoration(
        
        suffixIcon: icon??const SizedBox(),
         labelText: labelText,
         labelStyle:const TextStyle(color: Colors.white),
         enabledBorder:const OutlineInputBorder(
           borderSide: BorderSide(
               color: Colors.white,
           ),
         ) ,
         border:const OutlineInputBorder(
           borderSide: BorderSide(
               color: Colors.white,
           ),
         ),
       ),
     );
  }
}