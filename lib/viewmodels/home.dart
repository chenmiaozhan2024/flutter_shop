class BannerItem{
  String id;
  String imgUrl;
  BannerItem({required this.id,required this.imgUrl});
  factory BannerItem.formJSON(Map<String,dynamic> json){
    return BannerItem(id: json["id"]??"", imgUrl: json["imgUrl"]??"");
  }
}
class CategoryItem {
  final String id;
  final String name; 
  final String picture;
  final List<CategoryItem> children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    List<CategoryItem>? children,
  }) : children = children ?? [];

  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] == null ? [] : (json["children"] as List).map((e) => CategoryItem.fromJSON(e)).toList()
    );
  }
}

class GoodsItem {
  final String id;
  final String name;
  final String? desc;
  final String price;
  final String picture;
  final int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"],
      price: json["price"] ?? "",
      picture: json["picture"] ?? "",
      orderNum: json["orderNum"] ?? 0,
    );
  }
}

class GoodsItems {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJSON(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: (json["items"] as List).map((e) => GoodsItem.fromJSON(e)).toList(),
    );
  }
}

class SubType {
  final String id;
  final String title;
  final GoodsItems goodsItems;

  SubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory SubType.fromJSON(Map<String, dynamic> json) {
    return SubType(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      goodsItems: GoodsItems.fromJSON(json["goodsItems"] ?? {}),
    );
  }
}

class SpecialRecommend {
  final String id;
  final String title;
  final List<SubType> subTypes;

  SpecialRecommend({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommend.fromJSON(Map<String, dynamic> json) {
    return SpecialRecommend(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: (json["subTypes"] as List).map((e) => SubType.fromJSON(e)).toList(),
    );
  }
}
