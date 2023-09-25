import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    required this.onTap
  });
  final String buttonName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        width:double.infinity ,
        height: 50,
        child:  Center(child:  Text( buttonName ,style:const TextStyle(color: Color(0xff2B475E),fontSize: 20,fontFamily: 'Pacifico'),),),),
    );
  }
}