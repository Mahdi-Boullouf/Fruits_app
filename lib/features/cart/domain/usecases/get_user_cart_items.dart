import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/domain/entities/demand.dart';
import 'package:fruit_animations_app/features/cart/domain/repositories/cart_repo.dart';

class GetCartItems{
  final CartRepo cartRepo ;

  GetCartItems({required this.cartRepo}); 


  Future<Either<Failure,List<Demand>>> call(String userId){
    return cartRepo.getUserCartItems(userId);
    
  }
}