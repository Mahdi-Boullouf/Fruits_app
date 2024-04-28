import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_filter_state.dart';

class ProductsFilterCubit extends Cubit<ProductsFilterState> {
  ProductsFilterCubit() : super(const ProductFiltredByCategory("All"));
  changeCategory(String category){
    emit(ProductFiltredByCategoryChanged(category));
    
  }
}
