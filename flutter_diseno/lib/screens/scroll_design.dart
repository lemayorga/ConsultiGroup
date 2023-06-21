import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  const ScrollScreen({Key? key}) : super(key: key);
 static const boxDecoration =  BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5,0.5],
            colors: [
               Color(0xff5EE8C5),
               Color(0xff30BAD6),
            ]
          )
        );
        
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Color(0xff30BAD6),
      body: Container(
        decoration: boxDecoration,
        child: PageView (
          physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: const [
               Page1(),
               Page2()
            ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
          Background(),
          MainContent()
       ]
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize:  50, fontWeight: FontWeight.bold);

    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Text('11º',style: textStyle),
          Text('data',style: textStyle),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 10, color: Colors.white,)
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(image: AssetImage('assets/scroll-1.png'))
      );
  }
}


class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          onPressed: () {
            
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text('Bienvenido',style:TextStyle(fontSize:  30, color: Colors.white),),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff0098FA),
            shape: StadiumBorder(

            )
          ),
        ),
      ),
    );
  }
}