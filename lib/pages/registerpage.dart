import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incrementapp/helper/helperfunction.dart';

import '../components/mybutton.dart';
import '../components/mytextfield.dart';
import 'package:lottie/lottie.dart';

class MyRegisterPage extends StatefulWidget {

  final VoidCallback onToggle;
 MyRegisterPage({super.key ,  required this.onToggle});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}
  
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController confirmpassController = TextEditingController();




void registerUser(BuildContext context) async{

if(usernameController.text.isEmpty ||
 emailController.text.isEmpty||
 passController.text.isEmpty||
 confirmpassController.text.isEmpty){
  displayAlertMessageToUser('All fields are required', context);
  return;

 } 

  if(passController.text !=confirmpassController.text){
    displayAlertMessageToUser('password did not match',context);
    return;
    
  }

  showDialog(context: context, builder: (context){
    return Center( child: Lottie.asset('assets/images/Animation - 1736521859654.json'),);
  });

 try {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passController.text.trim());

     Navigator.pop(context);
  } on FirebaseAuthException catch(e){
    

    displayAlertMessageToUser('Cant login error', context);
     Navigator.pop(context);
  }
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      
      
      body: SingleChildScrollView(
        
        child: Container(
          
          padding: EdgeInsets.only(left: 23,right:23,top: 100),
          child: Column(
            
             mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              Icon(Icons.person,size: 150,color:  Colors.deepPurple.shade300,),
              Text('Register Here',style: GoogleFonts.blinker(fontSize: 32,fontWeight: FontWeight.bold),),
              SizedBox(height: 24,),
             MyTextField(
        
              icon: Icon(Icons.person),
              hintText: 'Enter your name',
              obsecureText: false,
              controller: usernameController,),
               SizedBox(height: 12,),
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
              MyTextField(
              icon: Icon(Icons.key),
              hintText: 'Renter your password',
              obsecureText: true,
              controller: confirmpassController,),
              SizedBox(height: 32,),
              MyButton (buttonColor: Colors.deepPurple.shade300,
              buttonName: 'Register',
              onPressed: (){
        
                registerUser(context);
              },),
              SizedBox(height: 12,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    child: Text('Login Here'),
                     onPressed:widget.onToggle,
                
        
                  )
                ],
              )
              
          
          ],),
        ),
      ),
    );
  }
}