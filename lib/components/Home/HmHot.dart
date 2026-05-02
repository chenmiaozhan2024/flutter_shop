import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmHot extends StatefulWidget {
  final SpecialRecommend? inVogueResult;
  final SpecialRecommend? oneStopResult;
  final String type;
  HmHot({Key? key, this.inVogueResult, this.oneStopResult,required this.type}) : super(key: key);

  @override
  _HmHotState createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  List<GoodsItem> _getInVogueResult(){
    if(widget.inVogueResult==null||widget.inVogueResult!.subTypes.isEmpty) return [];
    return widget.inVogueResult!.subTypes.first.goodsItems.items.take(2).toList();
  }
    List<GoodsItem> _getOneStepResult(){
    if(widget.oneStopResult==null||widget.oneStopResult!.subTypes.isEmpty) return [];
    return widget.oneStopResult!.subTypes.first.goodsItems.items.take(2).toList();
  }
  Widget _getHeader(){
    return Container(
      // width: double.infinity,
      // height: 200,
      
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.baseline,
         textBaseline: TextBaseline.alphabetic,
      children: [
        Text(widget.type=='hot'?"爆款推荐":"一站集成",style: TextStyle(color: Colors.amber,fontSize: 16),),
        SizedBox(width: 5,),
         Text(widget.type=='hot'?"最受欢迎":"核心优选",style: TextStyle(color: Colors.blue,fontSize: 12),),
      ],
    ),
    );
  }
  Widget _getChildren(){
      List<GoodsItem> goodsList =widget.type == 'hot' ? _getInVogueResult() : _getOneStepResult();
    return Container(
      // width: 80,
      // height: 100,
      child: Row(
        children: [
         Column(
          children:  [
            Image.network(widget.type=='hot'?goodsList[0].picture:goodsList[0].picture,width: 80,height: 100,),
            Text("¥${widget.type=='hot'?goodsList[0].price:goodsList[0].price}",style: TextStyle(color: Colors.red),)
            ]
         ),
          SizedBox(width: 10,),
          Column(
          children:  [
            Image.network(widget.type=='hot'?goodsList[1].picture:goodsList[1].picture,width: 80,height: 100,),
            Text("¥${widget.type=='hot'?goodsList[1].price:goodsList[1].price}",style: TextStyle(color: Colors.red))
            ]
         ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return  Container(
      width: 80,
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.type=="hot"?Color.fromARGB(255, 211, 228, 240):Color.fromARGB(255, 249, 247, 219),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
      children: [
        _getHeader(),
        SizedBox(height: 10,),
       _getChildren()
      ],
    ),
    )
    ;
  }
}