
import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/domain/repositories/cart_repo.dart';
import 'package:fruit_animations_app/features/cart/domain/usecases/delete_cart_item.dart';

class CheckoutItems{
  final CartRepo cartRepo ;

  CheckoutItems({required this.cartRepo}); 

  Future<Either<Failure,void>> call(String userId) async {
   final allItems =await  cartRepo.getUserCartItems(userId);
  return   allItems.fold((l) => Left( l), (items) async {
   for (var item in items){
        await cartRepo.deleteItem(item.id!);
    }
    return const Right(null);
  });
  }



}