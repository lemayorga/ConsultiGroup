import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    const fontSize3 = TextStyle( fontSize: 30);
    // int counter = 10;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('data'),
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,        
          children: const <Widget> [
              Text('Número de clicks', style:  fontSize3 ),
              Text('counter', style:  fontSize3 )
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton:  FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
       //   print('asdsa');
          // counter  ++;
        }),
    );
  }
}