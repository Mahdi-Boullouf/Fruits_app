import 'package:fruit_animations_app/features/products/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({required super.name,  required super.image, required super.id, required super.price, required super.description, required super.category});
  factory ProductModel.fromJson(dynamic json){
    return ProductModel(name: json['name'], image: json['image'], id: json['id'], price: json['price'], description: json['description'], category: json['category']);
  }


  Map<String,dynamic> get toJson=>{'name':name,'image':image,'id':id,'price':price,'description':description,'category':category};
}