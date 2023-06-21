import 'package:flutter/material.dart';

class LisView1Screen extends StatelessWidget {
   

  final options = const ['Juego 1','Juego 2','Juego 3','Juego 4','Juego 5']; 
  const LisView1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('ListView Tipo 1'),
      ),
      body:  ListView(
         children:  [
          ...options.map((game) => ListTile(
            title: Text(game),
            trailing: const Icon(Icons.arrow_back_ios_new_outlined),
            )
          ).toList(),
         ]
      ),
    );
  }
}