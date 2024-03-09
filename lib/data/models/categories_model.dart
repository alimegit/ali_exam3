
class CategoriesModel{
  final int? id;
  final String name;
  final String imageUrl;
  CategoriesModel({
     this.id,
    required this.name,
    required this.imageUrl,
});
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
    );
  }
}