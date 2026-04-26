import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String,String>> _tabList = [
    {
      "icon":"lib/assets/ic_public_home_normal.png",
      "text":"首页",
      "activeIcon":"lib/assets/ic_public_home_active.png",
      },
      {
        "icon":"lib/assets/ic_public_pro_normal.png",
        "text":"分类",
        "activeIcon":"lib/assets/ic_public_pro_active.png",
      },
      {
        "icon":"lib/assets/ic_public_cart_normal.png",
        "text":"购物车",
        "activeIcon":"lib/assets/ic_public_cart_active.png",
      },
      {
        "icon":"lib/assets/ic_public_my_normal.png",
        "text":"我的",
        "activeIcon":"lib/assets/ic_public_my_active.png",
      },
  ];
  int _currentIndex=0;
  List<BottomNavigationBarItem> _getTabBarWidgets(){
    return _tabList.map((item){
      return BottomNavigationBarItem(
        
        icon: Image.asset(item["icon"]!,width: 24,height: 24,),
        activeIcon: Image.asset(item["activeIcon"]!,width: 24,height: 24,),
        label: item["text"]!,
      );
    }).toList();
  }
  List<Widget> _getChildren(){
    return [HomeView(),CateGoryView(),CartView(),MineView()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getChildren(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex,
        selectedItemColor: Colors.black,//设置选中时候，tab的字的颜色
        showUnselectedLabels: true,//是否没有选择中的时候也展示文字
        unselectedItemColor: Colors.black,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          }); 
        },
        items: _getTabBarWidgets(),
      ),
    );
  }
}