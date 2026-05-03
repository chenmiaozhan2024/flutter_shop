// import 'package:dio/dio.dart';
import 'package:hm_shop/contants/index.dart';
import 'package:hm_shop/utils/index.dart';
import 'package:hm_shop/viewmodels/user.dart';
//登录api
Future<UserInfo> loginAPI(Map<String,dynamic> data) async{
  // FormData formData = FormData.fromMap(data);
  return UserInfo.fromJSON( await dioRequest.post(HttpConstants.LOGIN, data: data) );
}