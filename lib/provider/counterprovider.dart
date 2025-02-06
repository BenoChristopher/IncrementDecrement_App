import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;



class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0) {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _loadCounter();
      } else {
        state = 0; 
      }
    });
  }

  
  Future<void> _loadCounter() async {
    String? uid = _auth.currentUser?.uid;
    if (uid == null) return;

    DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      state = (doc.data() as Map<String, dynamic>)['value'] ?? 0;
    } else {
      await _firestore.collection('users').doc(uid).set({'value': state});
    }
  }

  
  Future<void> increment() async {
    state++;

    _updateCounter();
  }

  Future<void> decrement() async {




    state--;
    _updateCounter();
  }

  Future<void> _updateCounter() async {
    String? uid = _auth.currentUser?.uid;
    if (uid != null) {
      await _firestore.collection('users').doc(uid).set({'value': state}, SetOptions(merge: true));
    }
  }
}



final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});
