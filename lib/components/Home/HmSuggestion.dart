import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  HmSuggestion({Key? key}) : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
       alignment: Alignment.center,
       color: Colors.blue,
       height: 200,
       child: Text('建议',style: TextStyle(color: Colors.white),),
    ),);
  }
}