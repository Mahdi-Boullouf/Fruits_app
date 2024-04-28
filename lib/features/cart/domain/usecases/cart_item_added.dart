import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/domain/repositories/cart_repo.dart';

class AddCartItem{

  final CartRepo cartRepo;

  AddCartItem({required this.cartRepo});
  Future<Either<Failure,void>> call(Map<String,dynamic> demandJson){
      return cartRepo.addItem(demandJson);
  }
}