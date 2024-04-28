import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_product.dart';

part 'proudct_quantity_counter_state.dart';

class ProudctQuantityCounterCubit extends Cubit<ProudctQuantityCounterState> {
  ProudctQuantityCounterCubit() : super(const ProudctQuantityCounterChanged(quantity: 1));
 int _cartQuantity = 1 ; 
//   increment(String productId) async {
//     final product =await getProduct(productId);
//    product.fold((error) => emit(ProudctQuantityCounterError(state.kgs, message:error.message)), (product) {
//     // and lets suppose we have just 10 kgs in product stock [product.stock]
//     if(state.kgs > 10){
//     emit(ProudctQuantityCounterError(state.kgs, message: "We dont have that quantity [-${state.kgs} Kgs]"));
//     }
// else{
//   // ProudctQuantityCounterChanged(quantity: state.kgs++);
// }
//    });
//   }
//   decrement(){
    
//     // emit(ProudctQuantityCounterChanged(quantity: state.kgs--));
//   }
// }
checkIfProductAvailableWithTheDemandQuantityAtTheRealtime(int quantity){

}

  increment(){
      _cartQuantity = state.kgs+1;

    emit(ProudctQuantityCounterChanged(quantity: state.kgs +1));
  }
  decrement(){
    if(state.kgs !=1){
    log(state.kgs.toString());
      _cartQuantity = state.kgs-1;

    emit(ProudctQuantityCounterChanged(quantity: state.kgs -1));

    }

  }
int get getQuantity => _cartQuantity;

}