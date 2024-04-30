part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}
final class CartItemsLoading extends CartState {

}
final class CartItemsLoaded extends CartState {
  final List<Demand> demands;
  final double subTotal ; 
  final double tax ; 
  const CartItemsLoaded( {required this.demands,required this.subTotal,required this.tax});
}
final class CartItemAdded extends CartState {

}
final class CartItemDeleted extends CartState {

}


final class CartItemCheckedOut extends CartState{

}
final class CartError extends CartState {
final String message;

  const CartError({required this.message});
}