import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   List<BannerItem> _bannerList=[];
  List<Widget> _getScrollChildren(){
    return [
      // 轮播图
      SliverToBoxAdapter(
        child: HmSlider(bannerList:_bannerList),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      //分类
      SliverToBoxAdapter(
        child: HmCategory(),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      // 推荐
       SliverToBoxAdapter(
        child: HmSuggestion(),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      // 爆款推荐和
      SliverToBoxAdapter(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(direction: Axis.horizontal,
          children: [
          Expanded(child: HmHot()),
          SizedBox(width: 10,),
          Expanded(child: HmHot())
          ])
         ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      HmMoreList()
    ];
  }

 
  @override
  void initState() {
    _getBannderList();
    // TODO: implement initState
    super.initState();
  }
  void _getBannderList()async {
     _bannerList= await getBannerListAPI();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: CustomScrollView(
        slivers: _getScrollChildren(),
       )
    );
  }
}