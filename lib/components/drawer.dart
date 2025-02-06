import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOutUser(){
    FirebaseAuth.instance.signOut()
;  }

  @override
  Widget build(BuildContext context) {
    return 
      Drawer(
        backgroundColor: Colors.white,
        child: ListView(


          children: [
            ListTile(
              onTap: (){logOutUser();},
              title: Text('LogOut'),
              leading: Icon(Icons.logout),
            )
          ],
        ),
      );
    
  }
}