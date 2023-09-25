import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context,String massege) {
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(massege)));
  }
