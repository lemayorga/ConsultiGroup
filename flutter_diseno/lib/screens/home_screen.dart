import 'package:flutter/material.dart';
import 'package:flutter_diseno/widgets/background.dart';
import 'package:flutter_diseno/widgets/card_table.dart';
import 'package:flutter_diseno/widgets/custom_bottom_navigator.dart';
import 'package:flutter_diseno/widgets/page_title.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body: Stack(
         children:[
          BackgroundScreen(),

          _HomeBody()
         ]
      ),
      bottomNavigationBar: CustomBottomNavigator(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [

          //Titulos
          PageTitle(),

          //Card Table
          CardTable()
        ],
      ),
    );
  }
}