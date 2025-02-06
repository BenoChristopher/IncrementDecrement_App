import 'package:flutter/material.dart';
import 'package:incrementapp/pages/registerpage.dart';

import '../pages/loginpage.dart';

class MyTogglePage extends StatefulWidget {
  const MyTogglePage({super.key});

  @override
  State<MyTogglePage> createState() => _MyTogglePageState();


}

bool showRegisterPage =true;




class _MyTogglePageState extends State<MyTogglePage> {

  void togglePages(){
   

  setState((){
    showRegisterPage =! showRegisterPage;
  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showRegisterPage 
          ? MyRegisterPage( onToggle: togglePages,) 
          :MyLoginPage(onToggle: togglePages,) 
    );
  }
}