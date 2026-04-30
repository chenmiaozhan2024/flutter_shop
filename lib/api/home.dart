import 'package:hm_shop/contants/index.dart';
import 'package:hm_shop/utils/index.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI()async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerItem.formJSON(item as Map<String,dynamic>);
  }).toList();
}
Future<List<CategoryItem>> getCategoryListAPI() async{
  return ((await dioRequest.get(HttpConstants.Category_LIST)) as List).map((item){
    return CategoryItem.fromJSON(item);
  }).toList();
}