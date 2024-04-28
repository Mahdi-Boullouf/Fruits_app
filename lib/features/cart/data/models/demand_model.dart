

import 'package:fruit_animations_app/features/cart/domain/entities/demand.dart';

class DemandModel extends Demand {
  DemandModel(
      {super.userId, super.id, super.price, super.productId, super.quantity});
  factory DemandModel.fromJson(dynamic json) {
  return  DemandModel(
      userId: json['user_id'],
      price:json['price'] ,
      id: json['id'],
      productId: json['product_id'] ,
      quantity: json['quantity']);
  }
  Map<String, dynamic> get toJson => {
        "user_id": userId,
        "price": price,
        "product_id": productId,
        "quantity": quantity,
        'id': id
      };
}
