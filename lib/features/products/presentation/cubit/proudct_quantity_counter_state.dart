part of 'proudct_quantity_counter_cubit.dart';

sealed class ProudctQuantityCounterState extends Equatable {
  const ProudctQuantityCounterState(this.kgs);
  final int kgs ;
  @override
  List<Object> get props => [];
}

final class ProudctQuantityCounterInitial extends ProudctQuantityCounterState {
  const ProudctQuantityCounterInitial() : super(1);
}
final class ProudctQuantityCounterChanged extends ProudctQuantityCounterState {
final int quantity ;
  const ProudctQuantityCounterChanged({required this.quantity}) : super(quantity);
    @override
  List<Object> get props => [quantity];
}
final class ProudctQuantityCounterError extends ProudctQuantityCounterState {
  final String message ;

  const ProudctQuantityCounterError(super.kgs, {required this.message}); 
}


