import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/data/datasources/base/cart_data_source.dart';
import 'package:fruit_animations_app/features/cart/data/models/demand_model.dart';
import 'package:hive/hive.dart';

class CartLocalSource extends CartDataSource{
  final cartBox =Hive.openBox('cart');
  @override
  Future<Either<Failure, void>> addItem(dynamic itemJsonData) async {
               final db =  Hive.box("cart");

    String key = DateTime.now().millisecondsSinceEpoch.toString();
    itemJsonData['id'] = key ;
    log(itemJsonData.toString());
    db.put(key, itemJsonData);

    return const Right(null);   
  }

  @override
  Future<Either<Failure, void>> deleteItem(String id) async {
    // TODO: implement deleteItem
              final db =  Hive.box("cart");

 db.delete(id);
    return const Right(null);   

  }

  @override
  Future<Either<Failure, dynamic>> getUserCartItems(String userId) async {

        final db =  Hive.box("cart");
        db.values.map((e) => log(e.toString())).toList();
        
        return Right( (db.values.toList()));
    
}

}