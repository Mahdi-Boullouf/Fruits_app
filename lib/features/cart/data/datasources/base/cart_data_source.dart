import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/data/models/demand_model.dart';

abstract class CartDataSource{
  Future<Either<Failure,dynamic>> getUserCartItems(String userId);
  Future<Either<Failure,void>> addItem(dynamic itemJsonData,);
  Future<Either<Failure,void>> deleteItem(String id);

}