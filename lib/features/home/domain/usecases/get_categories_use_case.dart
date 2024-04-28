import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/home/domain/entities/category.dart';
import 'package:fruit_animations_app/features/home/domain/repo/categories_repo.dart';

class GetCategoriesUseCase{
  final CategoryRepo categoryRepo ;

  GetCategoriesUseCase({required this.categoryRepo}); 

  Future<Either<Failure, List<Category>>> call() async {
    final categories = await categoryRepo.getCategories();
    return categories;
  }

}