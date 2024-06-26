
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_animations_app/features/cart/data/models/demand_model.dart';
import 'package:fruit_animations_app/features/cart/domain/entities/demand.dart';
import 'package:fruit_animations_app/features/cart/domain/usecases/add_cart_item.dart';
import 'package:fruit_animations_app/features/cart/domain/usecases/checkout_items.dart';
import 'package:fruit_animations_app/features/cart/domain/usecases/delete_cart_item.dart';
import 'package:fruit_animations_app/features/cart/domain/usecases/get_user_cart_items.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit( {required this.checkoutItems, required this.addCartItem,required this.deleteCartItem,required this.getCartItems,required this.getProduct,}) : super(CartInitial());
  final AddCartItem addCartItem;
  final DeleteCartItem deleteCartItem;
  final GetCartItems getCartItems;
  final GetProduct getProduct;
  final CheckoutItems checkoutItems; 


  getCartUserItems(String userId) async {
    emit(CartItemsLoading());
   final items = await  getCartItems(userId);
   items.fold((l) {
     emit(CartError(message: l.message));
   },(r){
    
         double subTotal = 0 ; 
            double tax = 5 ; // you could get it from backend based on your project usecase

     for(var e in r){
            subTotal = (e.price! * e.quantity!) +subTotal;
            

     }
     subTotal =double.parse( subTotal.toStringAsFixed(2));

    emit(CartItemsLoaded(demands: r, subTotal: subTotal, tax:r.isEmpty?0: tax));

   });

  }

  deleteItem(String itemId) async {
    emit(CartItemsLoading());
    final ff = await deleteCartItem(itemId);
    ff.fold((l) => emit(CartError(message: l.message)), (r) => emit(CartItemDeleted()));
  }

  addItem({required String productId,required int quantity}) async {
    print("item added");
    String userId = "mahdi";
    emit(CartItemsLoading());
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    final demand =await getProduct(productId);
  demand.fold((l) => emit(CartError(message: l.message)), (r) async {
double totalPrice = r.price * quantity ; 
    final cartItem = DemandModel(id: id,  price:totalPrice ,productId:productId ,quantity: quantity,userId: userId);
    final ff = await addCartItem(cartItem.toJson);
    ff.fold((l) => emit(CartError(message: l.message)), (r) => emit(CartItemAdded()));
  });
    
  }


  checkoutUserItems() async {
String userId = "mahdi";
emit(CartItemsLoading());
final checkoutResult =await checkoutItems(userId);
checkoutResult.fold((l) => emit(CartError(message: l.message)), (r) => emit(CartItemCheckedOut()));
getCartUserItems(userId);
  
  }

  

}
