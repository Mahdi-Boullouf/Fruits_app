import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';
import 'package:fruit_animations_app/core/ui/components/shimmer_widget.dart';
import 'package:fruit_animations_app/features/cart/domain/entities/demand.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key, required this.demand});
  final Demand demand;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('they pass me ${widget.demand.productId}');
    context.read<ProductsCubit>().getSingleProduct(widget.demand.productId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(

      builder: (context, state) {
        if(state is ProductLoaded){
  return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.asset(
              state.product.image,
              width: 52.w,
              height: 53.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          title: CustomText(
            state.product.name,
            fontSize: 18.sp,
          ),
          subtitle: CustomText("\$ ${state.product.price} / per pkg"),
          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: AppColors.primaryColor,
            ),
            width: 34.w,
            height: 37.h,
            child: Center(
                child: CustomText(
              widget.demand.quantity!.toString(),
              fontSize: 18.sp,
              color: AppColors.onPrimaryColor,
            )),
          ),
          contentPadding: EdgeInsets.only(bottom: 12.h),
          shape: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.onBgTextColor.withOpacity(.35))),
        );
        }
        return Container(margin: EdgeInsets.only(bottom: 8.h), child: ShimmerCard(height: 70.h));
      
      },
    );
  }
}
