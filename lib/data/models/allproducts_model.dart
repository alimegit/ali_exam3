import 'package:alisher_exam3/data/models/allProductModelConstants.dart';

class ProductsModel {
  final int? _id;
  final int? dbId;
  final int categoryId;
  final String name;
  final int price;
  final String imageUrl;
  final String description;
  final int? count;
  final bool? isFavourite;

  ProductsModel(
      {
      this.isFavourite,
      this.dbId,
      int? id,
      this.count,
      required this.name,
      required this.categoryId,
      required this.price,
      required this.description,
      required this.imageUrl}) : _id = id;

  ProductsModel copyWith(
      {int? id,
      int? dbId,
      int? categoryId,
      String? name,
      int? price,
      String? imageUrl,
      String? description,
      int? count,
        bool? isFavourite
      }) {
    return ProductsModel(
        id: id ?? this._id,
        dbId: dbId ?? this.dbId,
        count: count ?? this.count,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
        price: price ?? this.price,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
    isFavourite: isFavourite ?? this.isFavourite,);
  }

  Map<String, dynamic> toJson() {
    return {
      AllProductModelConstants.id: _id,
      AllProductModelConstants.dbId: dbId,
      AllProductModelConstants.imageUrl: imageUrl,
      AllProductModelConstants.count: count,
      AllProductModelConstants.description: description,
      AllProductModelConstants.categoryId: categoryId,
      AllProductModelConstants.name: name,
      AllProductModelConstants.price: price,
      AllProductModelConstants.isFavourite:isFavourite ,
    };
  }
// bool canAddTaskToDataBase(){
//   if(id == 0) return false;
//   if(dbId == 0) return false;
//
//
// }
  static ProductsModel initialValue =
      ProductsModel(
          name: "",
          categoryId: 0,
          price: 0,
          description: "",
          imageUrl: "",
        isFavourite: false
      );

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        imageUrl: json["image_url"] as String? ?? "",
        description: json["description"] as String? ?? "",
        categoryId: json["category_id"] as int? ?? 0,
        price: json["price"] as int? ?? 0);
  }
}
