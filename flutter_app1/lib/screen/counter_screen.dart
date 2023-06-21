import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  
  int counter = 10;
  void increase() => setState(() => counter ++);
  void decrease() => setState(() => counter --);
  void reset() => setState(() => counter = 0);

  @override
  Widget build(BuildContext context) {

    const fontSize3 = TextStyle( fontSize: 30);
 
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,        
          children: <Widget> [
              const Text('Número de clicks', style:  fontSize3 ),
              Text('$counter', style:  fontSize3 )
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomeFloatingAcions(
        increaseFN: increase,
        decreaseFN:  decrease,
        resetFN: reset,
      ),
    );
  }
}

class CustomeFloatingAcions extends StatelessWidget {

  const CustomeFloatingAcions({ super.key, required this.increaseFN, required this.decreaseFN, required this.resetFN});
 
  final Function increaseFN;
  final Function decreaseFN;
  final Function resetFN;

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_outlined),
          onPressed: () =>  increaseFN()
        ),

          const SizedBox(width: 20,),

          FloatingActionButton(
            child:  const Icon(Icons.explicit_outlined),
            onPressed:() =>  resetFN()
          ), 

          const SizedBox(width: 20,),

          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed:() =>  decreaseFN()
          ),        
      ],
    );
  }
}