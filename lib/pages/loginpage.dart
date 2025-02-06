import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incrementapp/helper/helperfunction.dart';
import 'package:lottie/lottie.dart';

import '../components/mybutton.dart';
import '../components/mytextfield.dart';

class MyLoginPage extends StatefulWidget {

  final VoidCallback onToggle;
  const MyLoginPage({super.key, required this.onToggle});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}


TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();


void loginUser(BuildContext context) async{

   showDialog(context: context, 
    barrierDismissible: false,
    builder: (context){
       return Center(
        child:Lottie.asset('assets/images/Animation - 1736521859654.json'),
      );

    });

    Future.delayed( Duration(seconds: 3), (){
      if (Navigator.canPop(context)){
        Navigator.pop(context);
      }
    });

  try{

   
    

    await FirebaseAuth.instance.signInWithEmailAndPassword
    (email: emailController.text.trim(),
     password: passController.text.trim());
     Navigator.pop(context);


  }on FirebaseAuthException catch(e){
    displayAlertMessageToUser(' Invalid credentials error occured', context);
    Navigator.pop(context);
  }


}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 23),
          height: MediaQuery.of(context).size.height,
          child: Column(
            
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              Icon(Icons.person,size: 150,color:  Colors.deepPurple.shade300,),
              Text('Login Here',style: GoogleFonts.blinker(fontSize: 32,fontWeight: FontWeight.bold),),
              SizedBox(height: 24,),
            
              MyTextField(
              icon: Icon(Icons.email),
              hintText: 'Enter your email',
              obsecureText: false,
              controller: emailController,),
        
              SizedBox(height: 12,),
              
              MyTextField(
              icon: Icon(Icons.key),
              hintText: 'Enter your password',
              obsecureText: true,
              controller: passController,),
             SizedBox(height: 12,),
             
              MyButton (buttonColor: Colors.deepPurple.shade300,
              buttonName: 'Login',
              onPressed: (){ loginUser(context);},),SizedBox(height: 12,)
              ,Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(child: Text('Register Here'), onPressed:widget.onToggle,
                
        
                  )
                ],
              )
              
          
          ],),
        ),
      ),
    );
  }
}