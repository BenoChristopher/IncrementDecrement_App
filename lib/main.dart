import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incrementapp/Auth/authpage.dart';

import 'Auth/togglepage.dart';
import 'pages/loginpage.dart';
import 'pages/registerpage.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       
       scaffoldBackgroundColor: Colors.white,
       
      ),
      debugShowCheckedModeBanner: false,
      
      home:AuthPage(),

      
    );
  }
}



