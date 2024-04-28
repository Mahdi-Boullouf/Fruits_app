part of 'products_filter_cubit.dart';

sealed class ProductsFilterState extends Equatable {
  final String category;
  const ProductsFilterState(this.category);

  @override
  List<Object> get props => [category];
}

 class ProductFiltredByCategory extends ProductsFilterState {
  const ProductFiltredByCategory(super.category);

}
class ProductFiltredByCategoryChanged extends ProductsFilterState {
  const ProductFiltredByCategoryChanged(super.category);

}



