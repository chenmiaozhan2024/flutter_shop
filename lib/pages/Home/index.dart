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
   final ScrollController _controller=ScrollController();
   // 推荐列表
  List<GoodDetailItem> _recommendList = [];

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
      HmMoreList(recommendList:_recommendList)
    ];
  }

 
  @override
  void initState() {
    _getBannderList();
    _getCategoryList();
    _getSpecialRecommend();
    _getInVogueResult();//获取热榜推荐
    _getStopResult();//获取一站集成
    _getRecommendList();
    _registerEvent();
    // TODO: implement initState
    super.initState();
  }
  // 注册事件
  void _registerEvent(){
    _controller.addListener((){
      if(_controller.position.pixels>=(_controller.position.maxScrollExtent-50)){
        _getRecommendList();
      }
    });
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
  int _page=1;//页面
  bool _isLoading=false;//当前正在加载状态
  bool _hasMore=true;

    void _getRecommendList() async {
      //如果是加载状态或者已经没有下一页了
      if(_isLoading||!_hasMore){
        return;
      }
      _isLoading=true;
       int requestLimit=_page*8;
      _recommendList = await getRecommendListAPI({"limit":  requestLimit});
      _isLoading=false;
    setState(() {});
    //已经没有下一页了
    if(_recommendList.length<requestLimit){
      _hasMore=false;
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: CustomScrollView(
        controller: _controller,
        slivers: _getScrollChildren(),
       )
    );
  }
}