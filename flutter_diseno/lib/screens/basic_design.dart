import 'package:flutter/material.dart';

class BasiDesignScreen extends StatelessWidget {
   
  const BasiDesignScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/download.jpg')),   
          Title(),

          ButtomSection(),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
            child: Text('Texto texot ;;;;;adssadadasdsadsadasdas')
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Primer texto',  style:  TextStyle(fontWeight: FontWeight.bold),),
                Text('Segundo texto',  style:  TextStyle(color:  Colors.black45),),
            ],
          ),

          Expanded(
            child: Container()
          ),
          Icon(Icons.star, color:  Colors.red,),
          Text('41')
        ],
      ),
    );
  }
}

class ButtomSection extends StatelessWidget {
  const ButtomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButtom(icon: Icons.call, text: 'Call',),
          CustomButtom(icon: Icons.route, text: 'Route',),
          CustomButtom(icon: Icons.share, text: 'Share',),
    
        ],
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final IconData icon;
  final String text;
  
  const CustomButtom({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color:  Colors.blue, size: 30,),
        Text(text, style: TextStyle(color:  Colors.blue),)
      ]
    );
  }
}