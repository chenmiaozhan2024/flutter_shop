import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommend? specialRecommend;
  HmSuggestion({Key? key,required this.specialRecommend}) : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
 Widget _buildHeader(){
  return Row(
    children: [
      Text("特惠推荐",style: TextStyle(
        color: const Color.fromARGB(255, 204, 78, 78),
        fontSize: 16,
        fontWeight: FontWeight.w700
      ),),
      SizedBox(width:10),
      Text("精选省攻略",style: TextStyle(
        color: Colors.red
      ),)
    ],
  );
 }
 Widget _buildLeft(){
  return Container(
    width: 100,
    height: 140,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('lib/assets/home_cmd_inner.png'),fit:BoxFit.cover),
        
    ),
  );
 }
List<GoodsItem> _getDisplayItem() {
  if (widget.specialRecommend == null || widget.specialRecommend!.subTypes.isEmpty) {
    return [];
  }
  return widget.specialRecommend!.subTypes.first.goodsItems.items.take(3).toList();
}
 List<Widget> _buildRight(){
  // return 
  List<GoodsItem> list=_getDisplayItem();
  return List.generate(list.length,(int index){
      return Column(
        children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            errorBuilder: (context,error,StackTrace){
                return Image.asset("lib/assets/home_cmd_sm.png",width: 100,height: 140,fit: BoxFit.cover,);
            },  
            list[index].picture,
            width: 100,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10,),
        Container(
           padding:EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          decoration: BoxDecoration(
           
            color: const Color.fromARGB(255, 218, 45, 74),
            borderRadius: BorderRadius.circular(12)
          ),
            child: Text("${list[index].price}",style: TextStyle(
            color: Colors.white
          ),),
        )
      ],
      );
  });
 }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
       alignment: Alignment.center,
       padding: EdgeInsets.all(12),
      //  height: 200,
       decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_sm.png"),
          fit: BoxFit.cover
        )
       ),
       child: Column(
        children: [
           _buildHeader(),
           Row(
            children: [
              _buildLeft(),
              // SizedBox(width: 10,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: _buildRight() 
              )
              )
           ],)
        ],
        
       ),
    ),);
  }
}