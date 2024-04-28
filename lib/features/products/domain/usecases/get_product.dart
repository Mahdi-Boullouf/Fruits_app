import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';
import 'package:fruit_animations_app/features/products/domain/repos/products_repo.dart';

class GetProduct{
  final ProductsRepo productsRepo;

  GetProduct({required this.productsRepo});
  Future<Either<Failure,Product>> call(String id) async {
    final product = await productsRepo.getProduct(id);
    
    return product;
  }

}
