import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';
import 'package:fruit_animations_app/features/products/domain/repos/products_repo.dart';

class GetProductsUseCase {
  final ProductsRepo productsRepo;

  GetProductsUseCase({required this.productsRepo});
  Future<Either<Failure, List<Product>>> call() async {
    final products = await productsRepo.getProducts();
    return products;
  }
}
