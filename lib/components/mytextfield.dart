import 'package:flutter/material.dart';





class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.controller, required this.hintText, required this.obsecureText, required this.icon});

  
final TextEditingController controller;
final String hintText;
final bool obsecureText;
final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
              obscureText: obsecureText,
              decoration: InputDecoration(hintText: hintText,
              
              prefixIcon:icon,
              
              

              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),),
              controller: controller,
            
          ) ;
  }
}