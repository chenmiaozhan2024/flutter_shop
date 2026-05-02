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
//特惠推荐
Future<SpecialRecommend> getProductListAPI() async{
  return SpecialRecommend.fromJSON(await dioRequest.get(HttpConstants.PRODUCT_LIST));
}
//热榜推荐
Future<SpecialRecommend> getInvogueListAPI() async{
  return SpecialRecommend.fromJSON(
    await dioRequest.get(HttpConstants.HotInvogue)
  );
}
//一站式推荐
Future<SpecialRecommend> getOneStopListAPI() async{
  return SpecialRecommend.fromJSON(
    await dioRequest.get(HttpConstants.HotOneStop)
  );
}