
import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/domain/repositories/cart_repo.dart';

class DeleteCartItem{
  final CartRepo cartRepo ;

  DeleteCartItem({required this.cartRepo}); 
Future<Either<Failure,void>> call(String demandId)async{

  return  cartRepo.deleteItem(demandId);

}


}