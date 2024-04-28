import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';
import 'package:fruit_animations_app/features/products/domain/repos/products_repo.dart';

class GetProductsByCategoryUseCase{

  final ProductsRepo productsRepo;


  GetProductsByCategoryUseCase({required this.productsRepo});
  Future<Either<Failure,List<Product>>> call(String category) async {
    Either<Failure, List<Product>> 

    products = await  productsRepo.getProductsByCategory(category);

    
   return products;
  }
  
  
  }