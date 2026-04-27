import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  HmSlider({Key? key}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Container(
      height: 300,
      alignment: Alignment.center,
      color: Colors.blue,
       child: Text('轮播图'),
    ),);
  }
}