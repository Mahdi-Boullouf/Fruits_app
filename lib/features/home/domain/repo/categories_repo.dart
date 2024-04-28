import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';

import '../entities/category.dart';

abstract class CategoryRepo{
  Future<Either<Failure,List<Category>>> getCategories();
}