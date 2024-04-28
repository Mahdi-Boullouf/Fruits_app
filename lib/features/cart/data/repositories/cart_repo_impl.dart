import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/data/datasources/base/cart_data_source.dart';
import 'package:fruit_animations_app/features/cart/data/models/demand_model.dart';
import 'package:fruit_animations_app/features/cart/domain/entities/demand.dart';
import 'package:fruit_animations_app/features/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartDataSource cartDataSource;

  CartRepoImpl({required this.cartDataSource});
  @override
  Future<Either<Failure, void>> addItem(Map<String, dynamic> demandJson) async {
    // TODO: implement addItem
    try {
      cartDataSource.addItem(demandJson);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> deleteItem(String demandId) async {
    // TODO: implement deleteItem
    return cartDataSource.deleteItem(demandId);
  }

  @override
  Future<Either<Failure, List<Demand>>> getUserCartItems(String userId) async {
    // TODO: implement getUserCartItems
    final cartsRawData = await cartDataSource.getUserCartItems(userId);
    return cartsRawData.fold((l) {
      return Left(l);
    }, (r) {
      final List<DemandModel> items =
        List<DemandModel> .from(r.map((itemJson) => DemandModel.fromJson(itemJson)));
        log("I'm from repo impl and this is the result i get $r");
      return Right(items);
    });
  }
}
