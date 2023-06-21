import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
   
  const PageTitle({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classifi transaction',  style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 10,),
           
            Text('Classifi transactionsfsdfds', style:  TextStyle(fontSize: 16,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}