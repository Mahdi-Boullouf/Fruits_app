// import 'category.dart';
import '../../domain/entities/category.dart';

class CategoryModel extends Category{
  CategoryModel({required super.name ,required super.id,required super.image});
  factory CategoryModel.fromJson(dynamic json){
    return CategoryModel(name: json['name'], id: json['id'], image: json['image']);
  }
}

