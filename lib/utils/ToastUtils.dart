import 'package:flutter/material.dart';

class ToastUtils{
  static bool showLoading=false;
  static void showToast(BuildContext context,String?msg){
    //如果已经打开了
    if(ToastUtils.showLoading){
      return;
    }
    ToastUtils.showLoading=true;
    Future.delayed(Duration(seconds: 3),(){
      ToastUtils.showLoading=false;
    });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: 180,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(40)
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 5),
          content: Text(msg??"加载成功",textAlign: TextAlign.center,)
          )
      );
  }
}