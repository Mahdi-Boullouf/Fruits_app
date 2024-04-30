part of 'products_search_cubit.dart';

sealed class ProductsSearchState extends Equatable {
  const ProductsSearchState();

  @override
  List<Object> get props => [];
}

final class ProductsSearchInitial extends ProductsSearchState {}
final class ProductsSearchIconClicked extends ProductsSearchState{}
final class ProductsSearchLoading extends ProductsSearchState {}

final class ProductSearhSubmitted extends ProductsSearchState{
final String query;

  const ProductSearhSubmitted({required this.query});
    @override
  List<Object> get props => [query];
}

final class ProductSearchItemsError extends ProductsSearchState{
  final String message ;

  const ProductSearchItemsError({required this.message}); 
}