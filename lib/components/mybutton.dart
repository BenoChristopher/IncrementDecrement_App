import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.buttonName, required this.buttonColor,required this.onPressed});

  final String buttonName;
  final Color buttonColor;
  void Function()? onPressed;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
    style:ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 30),backgroundColor: buttonColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
     child: Text(buttonName,style: TextStyle(color: Colors.white,fontSize: 16)));
  }
}