
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incrementapp/components/mybutton.dart';
import 'package:incrementapp/components/drawer.dart';


import '../provider/counterprovider.dart';

class MyIncrementPage extends ConsumerWidget {
  const MyIncrementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider); 
    
    final countProvider = ref.read(counterProvider.notifier); 

    return Scaffold(
      appBar: AppBar(title: Text('Increment App', style: TextStyle(fontWeight: FontWeight.bold))),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(counter.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(buttonName: 'Decrement', buttonColor: Colors.red.shade400, onPressed: countProvider.decrement),
                SizedBox(width: 30),
                MyButton(buttonName: 'Increment', buttonColor: Colors.green.shade400, onPressed: countProvider.increment),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




