import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_animations_app/core/app/injector.dart';
import 'package:fruit_animations_app/core/error/failure.dart';
import 'package:fruit_animations_app/features/cart/data/datasources/base/cart_data_source.dart';
import 'package:fruit_animations_app/features/cart/data/datasources/base/cart_local_source.dart';

setUp() async {
  final cartItems = await injector.get<CartLocalSource>().getUserCartItems('mahdi');

  test("Is function returns map", () {
cartItems.fold((l) {
fail("Error ");

}, (r) {
print(r);

});
  }); 
  
}