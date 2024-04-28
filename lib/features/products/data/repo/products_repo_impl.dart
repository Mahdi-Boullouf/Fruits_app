
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/products/data/datasources/base/data_source.dart';
import 'package:fruit_animations_app/features/products/data/models/product_model.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';
import 'package:fruit_animations_app/features/products/domain/repos/products_repo.dart';

class ProductsRepoImpl extends ProductsRepo{
  final ProductsDataSource productsDataSource;

  ProductsRepoImpl({required this.productsDataSource});
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    // TODO: implement getProducts
  try {
        final responseData = await productsDataSource.getProducts() as List<Map>;
    final productsModels = responseData.map((e) => ProductModel.fromJson(e)).toList();
    return Right(productsModels);
  } on Failure catch (e) {
    return Left(e);
  }

  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category) async {
    // TODO: implement getProductsByCategory
   try {
        final responseData = await productsDataSource.getProductsByCategory(category) as List<Map>;
    final productsModels = responseData.map((e) => ProductModel.fromJson(e)).toList();
    return Right(productsModels);
  } on Failure catch (e) {
    return Left(e);
  }
  }

  @override
  Future<Either<Failure, List<Product>>> getSearchedProducts(String query) async {
    // TODO: implement getSearchedProducts
   try {
        final responseData = await productsDataSource.getSearchedProducts(query) as List<Map>;
    final productsModels = responseData.map((e) => ProductModel.fromJson(e)).toList();
    return Right(productsModels);
  } on Failure catch (e) {
    return Left(e);
  }
  }
  
  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    // TODO: implement getProduct
   try {

    final responseData = await productsDataSource.getProduct(id);
    // log(responseData);
    final product = ProductModel.fromJson(responseData);
    return Right(product);
      } on Failure catch (e) {
    return Left(e);
  }
  }

}