


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;


class CounterProvider extends StateNotifier<int> {
  CounterProvider() : super(0) {
    loadNum();
  }

  
  Future<void> loadNum() async {
    String? uid = auth.currentUser?.uid;
    if (uid == null) return;

    DocumentSnapshot doc = await firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      state = doc['value'];
    } else {
      await firestore.collection('users').doc(uid).set({'value': state});
    }
  }

  
  Future<void> increment() async {
    state++;
    updateNum();
  }

  
  Future<void> decrement() async {

      state--;
    updateNum();
  }

  
  Future<void> updateNum() async {
    String? uid = auth.currentUser?.uid;
    if (uid != null) {
      await firestore.collection('users').doc(uid).update({'value': state});
    }
  }
}


final counterProvider = StateNotifierProvider<CounterProvider, int>((ref) {
  return CounterProvider();
});
