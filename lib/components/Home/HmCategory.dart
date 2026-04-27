import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  HmCategory({Key? key}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
       child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context,int index){
          return Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            height: 100,
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text("第${index}个"),
          ),);
        }
        ),
    );
  }
}