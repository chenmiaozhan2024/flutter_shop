import 'package:hm_shop/contants/index.dart';
import 'package:hm_shop/utils/index.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<GoodsDetailsItems> getGuessListAPI(Map<String,dynamic> params) async{
  return GoodsDetailsItems.fromJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST,params: params)
  );

}

