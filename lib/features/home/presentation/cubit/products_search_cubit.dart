import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_search_state.dart';

class ProductsSearchCubit extends Cubit<ProductsSearchState> {
  ProductsSearchCubit() : super(ProductsSearchInitial());
stopSearching(){
  emit(ProductsSearchInitial());
}
  startSearching(){
    emit(ProductsSearchIconClicked());
  }
  searchProducts(String query) async {

 emit(ProductSearhSubmitted(query: query));


  }

  emitLoadingStateUntilUserFinishesTyping(){
    emit(ProductsSearchLoading());
  }
}
