
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_products_use_case.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.getProductsUseCase) : super(ProductsInitial());
  final GetProductsUseCase getProductsUseCase ; 
  getProducts() async {
    log("start");
    emit(ProductsLoading());
    final products =await getProductsUseCase();
    log(products.toString());
    products.fold((error) => emit(ProductsError(message: error.message)), (products) => emit (ProductsLoaded(products: products)));
  }


}
