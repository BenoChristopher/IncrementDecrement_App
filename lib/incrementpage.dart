import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:incrementapp/components/mybutton.dart';

import 'components/drawer.dart';

class MyIncrementPage extends StatefulWidget {
  const MyIncrementPage({super.key});

  @override
  State<MyIncrementPage> createState() => _MyIncrementPageState();
}
 



class _MyIncrementPageState extends State<MyIncrementPage> {
  int number =0;

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getNumber();
  }


  void getNumber()async{
    String? uid = auth.currentUser?.uid;
    if (uid == null) return; 
    DocumentSnapshot docsnapshot = await fireStore.collection('users').doc(uid).get();

    //DocumentSnapshot docsnapshot = await fireStore.collection('Numbers').doc('Counter').get();

    if(docsnapshot.exists){
      setState(() {
        number=docsnapshot['value'];
      });
    }
    else{
      await fireStore.collection('users').doc(uid).set({'value':number});
    }

  }

  

  void incrementNumber() async{

 setState(() {
   
   number++;
 });
  String? uid = auth.currentUser?.uid;
  if (uid != null) {
      await fireStore.collection('users').doc(uid).update({'value': number});
    }


}

void decrementNumber() async{
  setState(() {
    number--;
  });

  String? uid =auth.currentUser?.uid;
if(uid!=null )
{
  await fireStore.collection('users').doc('Counter').update({'value':number});

}
  
}

  
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Increment App',style: TextStyle(fontWeight: FontWeight.bold),),),
      drawer: MyDrawer(),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( number.toString() ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

           SizedBox(height: 80,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyButton(buttonName: 'Decrement', buttonColor: Colors.red.shade400, onPressed: (){ decrementNumber();}),
              SizedBox(width: 30,),
              MyButton(buttonName: 'Increment', buttonColor: Colors.green.shade400, onPressed: (){ incrementNumber();})
            ],
          )
        ],
      ),),
    );
  }
}