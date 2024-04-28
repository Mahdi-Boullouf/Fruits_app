
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_product.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_products.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_products_by_category.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.getProduct,  required this.getProductsUseCase,required this.getProductsByCategoryUseCase}) : super(ProductsInitial());
  final GetProductsUseCase getProductsUseCase ; 
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;
  final GetProduct getProduct;
  getProducts({String? category}) async {
    log("start");
    emit(ProductsLoading());
    late final Either<Failure, List<Product>> products;
    if(category == null || category == "All"){
     products =await getProductsUseCase();

    }else{
      products = await getProductsByCategoryUseCase(category);
    }
    log(products.toString());
    products.fold((error) => emit(ProductsError(message: error.message)), (products) => emit (ProductsLoaded(products: products)));
  }

  getSingleProduct(String productId) async {
    log("started function");
    emit(ProductsLoading());
    final result =await getProduct(productId);
    log("result got ${result}");
    result.fold((failure)=>emit(ProductsError(message: failure.message)), (product) => emit(ProductLoaded(product: product)));
    }





}
