
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/cart/presentation/cubit/cart_cubit.dart';

class CartBottomInfo extends StatelessWidget {
  const CartBottomInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if(state is CartItemsLoaded){
    
    return Container(
          color: AppColors.backgroundColor,
          padding: EdgeInsets.only(
            left: paddingMargin,
            right: paddingMargin,
            top: 8.h,
            bottom: 4.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    "Subtotal : ",
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    "\$${state.subTotal}",
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    "Tax : ",
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                                       "\$${ state.tax}",
    
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              4.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Grande Total : ",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                        "\$${state.subTotal + state.tax} ",
    
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ],
              ),
              16.verticalSpace,
              FilledButton(
                style:state.demands.isEmpty? ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor.withOpacity(.5))) : null,
                  onPressed: state.demands.isEmpty? null :  () {
                    context.read<CartCubit>().checkoutUserItems();
                    context.router.push(const CheckoutRoute());
                  },
                  child: const CustomText(
                    "Checkout",
                    color: AppColors.onPrimaryColor,
                  )),
            ],
          ),
        );
        }
        return const SizedBox();
        
      },
    );
  }
}
