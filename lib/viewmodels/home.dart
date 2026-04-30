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
      children: json["children"]==null?null:(json["children"] as List).map((e)=>CategoryItem.fromJSON(e)).toList()
    );
  }
}
