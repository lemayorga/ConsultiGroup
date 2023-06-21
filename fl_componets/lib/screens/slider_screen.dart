import 'package:fl_componets/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnabled = true;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text('Slider & Checks'),
      ),
      body: Column(
         children: [
          Slider.adaptive(
            min: 50,
            max: 400,
            value: _sliderValue, 
            activeColor: AppTheme.primary,
            onChanged: _sliderEnabled ? (value) {
              _sliderValue = value;
              setState(() { });
            }: null
            ),

            // Checkbox(
            //   value: _sliderEnabled,
            //    onChanged:(value) {
            //      _sliderEnabled = value ?? true;
            //       setState(() { });
            // }),


            CheckboxListTile(
               activeColor: AppTheme.primary,
               title:  const Text('Hablitar Slider'),
               value: _sliderEnabled, 
               onChanged:(value) {
                setState(() {  
                     _sliderEnabled = value ?? true; 
                });
            }),


            Switch(
              value: _sliderEnabled,
              onChanged:(value) {
               setState(() {  
                     _sliderEnabled = value; 
                });
            }),
            
            SwitchListTile.adaptive(
               activeColor: AppTheme.primary,
               title:  const Text('Hablitar Slider'),
               value: _sliderEnabled, 
               onChanged:(value) {
               setState(() {  
                     _sliderEnabled = value; 
                });
            }),

            const AboutListTile(),
            
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const NetworkImage('https://www.cinemascomics.com/wp-content/uploads/2020/09/batman-1939-original.jpg'),
                  fit: BoxFit.contain,
                  width:  _sliderValue,
                ),
              ),
            ),
         ]
      ),
    );
  }
}