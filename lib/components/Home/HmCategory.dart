import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  HmCategory({Key? key,required this.categoryList}) : super(key: key);

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context,int index){
          return Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 228, 230, 1),
               borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
            children: [
              Image.network(widget.categoryList[index].picture,width: 50,height: 50,),
              Text("${widget.categoryList[index].name}")
            ],
          ),
          )
          );
        }
        ),
    );
  }
}