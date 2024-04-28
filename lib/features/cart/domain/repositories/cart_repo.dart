import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/data/models/demand_model.dart';
import 'package:fruit_animations_app/features/cart/domain/entities/demand.dart';

abstract class CartRepo {
  Future<Either<Failure,List<Demand>>> getUserCartItems(String userId);
  Future<Either<Failure,void>> addItem(Map<String,dynamic> demandJson);
  Future<Either<Failure,void>> deleteItem(String demandId);

}