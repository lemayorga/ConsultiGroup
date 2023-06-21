import 'package:flutter/material.dart';

class LisView2Screen extends StatelessWidget {
   

  final options = const ['Juego 1','Juego 2','Juego 3','Juego 4','Juego 5']; 
  const LisView2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('ListView Tipo 1'),
       // elevation: 0,
        //backgroundColor: Colors.indigo,
      ),
      body:  ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) =>  ListTile(
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_back_ios_new_outlined, color:  Colors.indigo),
            onTap: () {
               // final game = options[index];
                // print(game);
                // Console(game)
            },
        ),
        separatorBuilder:  (_, index) =>  const Divider(),
      ),
    );
  }
}