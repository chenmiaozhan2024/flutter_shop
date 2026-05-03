import 'package:dio/dio.dart';
import 'package:hm_shop/contants/index.dart';

class DioRequest{
  final _dio=Dio();
  DioRequest(){
    _dio.options..baseUrl=GlobalConstants.BASE_URL
    ..connectTimeout=Duration(seconds: GlobalConstants.TIME_OUT)
    ..sendTimeout=Duration(seconds: GlobalConstants.TIME_OUT)
    ..receiveTimeout=Duration(seconds: GlobalConstants.TIME_OUT);
 
     _addInterceptor();
  }
 
  void _addInterceptor(){
    _dio.interceptors.add(
      InterceptorsWrapper(
        //请求拦截器
        onRequest: (request,handle){
            handle.next(request);
        },
        //响应拦截器
        onResponse: (response,handle){
          if(response.statusCode!>=200&&response.statusCode!<=300){
            handle.next(response);
            return;
          }
          handle.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error,handle){

        }
        //错误拦截器
      )
    );
   
  }
  Future<dynamic> get(String url,{Map<String,dynamic>? params} ){
    return  _handleResponse(_dio.get(url,queryParameters: params));
  }
   Future<dynamic> post(String url,{Map<String,dynamic>? data} ){
    return  _handleResponse(_dio.post(url,data:data));
  }
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task)async {
    try {
      Response<dynamic> res= await task;
      final data=res.data as Map<String,dynamic>;
      if(data["code"]==GlobalConstants.SUCCESS_CODE){
        return data["result"];
      }
      throw Exception(data["mes"]??"加载数据异常");
    } catch (e) {
      throw Exception(e);
    }
    // final data=res.data as 
  }
}
final dioRequest=DioRequest();