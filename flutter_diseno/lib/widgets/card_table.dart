import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
   
  const CardTable({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Table(
        children: const [
          TableRow(
            children: [
               _SingleCard(color: Colors.blue, text: 'General', icons: Icons.border_all,),
              _SingleCard(color: Colors.pinkAccent, text: 'Transporte', icons: Icons.car_rental,)
            ],            
          ),

          TableRow(
            children: [
               _SingleCard(color: Colors.purple, text: 'Shopping', icons: Icons.shop,),
              _SingleCard(color: Colors.purpleAccent, text: 'Bill', icons: Icons.cloud,)
            ],            
          ),

          TableRow(
            children: [
               _SingleCard(color: Colors.deepPurple, text: 'Entertainment', icons: Icons.movie,),
              _SingleCard(color: Colors.pinkAccent, text: 'Grocery', icons: Icons.food_bank_outlined,)
            ],            
          ),

          TableRow(
            children: [
               _SingleCard(color: Colors.blue, text: 'General', icons: Icons.border_all,),
              _SingleCard(color: Colors.pinkAccent, text: 'Transporte', icons: Icons.car_rental,)
            ],            
          )                               
        ],
    );
  }
}

class _SingleCard extends StatelessWidget {

 final IconData icons;
 final Color color;
 final String text;

  const _SingleCard({Key? key, required this.icons, required this.color, required this.text}) :super(key: key);
  
 
  @override
  Widget build(BuildContext context) {
    return  _CardBackground(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor:  color,
                child: Icon(icons, size: 35,color:Colors.white,),
                radius: 30,
              ),
      
              SizedBox(height: 10,), 
              
              Text(text,style: TextStyle(color:  color, fontSize: 18)),
            ],
          )
    );
  }
}

class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX:  5, sigmaY:  5),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}