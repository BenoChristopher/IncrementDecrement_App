
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/counterprovider.dart'; 

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  void logOutUser(BuildContext context, WidgetRef ref) async {
    await FirebaseAuth.instance.signOut();
    ref.invalidate(counterProvider); 
    Navigator.pushReplacementNamed(context, '/login'); 
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          ListTile(
            onTap: () =>


             logOutUser(context, ref),
             
            title: Text('Log Out'),
            leading: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
