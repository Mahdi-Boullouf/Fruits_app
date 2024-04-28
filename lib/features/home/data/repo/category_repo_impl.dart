import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/home/data/datasources/base/category_data_source.dart';
import 'package:fruit_animations_app/features/home/data/models/category_model.dart';
import 'package:fruit_animations_app/features/home/domain/entities/category.dart';
import 'package:fruit_animations_app/features/home/domain/repo/categories_repo.dart';

class CategoryRepoImpl implements CategoryRepo{
  final CategoryDataSource categoryDataSource ;

  CategoryRepoImpl({required this.categoryDataSource}); 
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    // TODO: implement getCategories
    try {
    final categories = await categoryDataSource.getProductsData() as List<Map<String,dynamic>>;
      final categoriesModels = categories.map((e)=>CategoryModel.fromJson(e)).toList();
      return Right(categoriesModels);
    } on Failure catch (e) {
      return Left(e);
    }



  }

}