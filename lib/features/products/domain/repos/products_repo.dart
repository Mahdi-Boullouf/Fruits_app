import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';

abstract class ProductsRepo{
  Future<Either<Failure,List<Product>>> getProducts();
  Future<Either<Failure,List<Product>>> getProductsByCategory(String category);
  Future<Either<Failure,List<Product>>> getSearchedProducts(String query);
  Future<Either<Failure,Product>> getProduct(String id);



  
}