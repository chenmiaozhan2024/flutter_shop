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
   List<CategoryItem> _categoryList=[];
   SpecialRecommend? _specialRecommend;
   SpecialRecommend? _oneStopResult;//一站集成
   SpecialRecommend? _inVogueResult;//热榜推荐
  List<Widget> _getScrollChildren(){
    return [
      // 轮播图
      SliverToBoxAdapter(
        child: HmSlider(bannerList:_bannerList),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      //分类
      SliverToBoxAdapter(
        child: HmCategory(categoryList: _categoryList,),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      // 推荐
       SliverToBoxAdapter(
        child: HmSuggestion(specialRecommend: _specialRecommend,),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      // 爆款推荐和
      SliverToBoxAdapter(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(direction: Axis.horizontal,
          children: [
          Expanded(child: HmHot(inVogueResult:_inVogueResult,type:"hot")),
          SizedBox(width: 10,),
          Expanded(child: HmHot(oneStopResult:_oneStopResult,type:'step'))
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
    _getCategoryList();
    _getSpecialRecommend();
    _getInVogueResult();//获取热榜推荐
    _getStopResult();//获取一站集成

    // TODO: implement initState
    super.initState();
  }
  void _getBannderList()async {
     _bannerList= await getBannerListAPI();
    setState(() {});
  }
  void _getCategoryList() async{
    _categoryList=await getCategoryListAPI();
     setState(() {});
  }
  void _getSpecialRecommend() async{
    _specialRecommend=await getProductListAPI();
    // print("home目录下的${this._specialRecommend}");
    setState(() {});
  }
  //获取热榜推荐数据
  void _getInVogueResult()async {
    _inVogueResult=await getInvogueListAPI();
     setState(() {});
  }
  //获取一站集成数据
  void _getStopResult() async{
    _oneStopResult=await getOneStopListAPI();
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