import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/app/injector.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_product.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/proudct_quantity_counter_cubit.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProudctQuantityCounterCubit(),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(
                children: [
                  ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: Hero(
                        tag: product.id,
                        child: Image.asset(
                          product.image,
                          height: 220.h,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingMargin, vertical: 20.h),
                    child: IconButton.filled(
                        style: const ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                AppColors.backgroundColor)),
                        onPressed: () {
                          context.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.primaryColor,
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  190.verticalSpace,
                  ProductDetailsBuild(product: product)
                ],
              )
            ],
          ),
        )),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            left: paddingMargin,
            right: paddingMargin,
            top: 8.h,
            bottom: 24.h,
          ),
          child: FilledButton(
              onPressed: () {
                log("ADded");
          
                final int quantity =
                    context.read<ProudctQuantityCounterCubit>().getQuantity;
                context
                    .read<CartCubit>()
                    .addItem(productId: product.id, quantity: quantity);
                    context.read<CartCubit>().getCartUserItems("mahdi");
              },
              child: const CustomText(
                "Add to cart",
                color: AppColors.onPrimaryColor,
              )),
        ),
      ),
    );
  }
}

class ProductDetailsBuild extends StatelessWidget {
  const ProductDetailsBuild({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 30.h),
      decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36), topRight: Radius.circular(36))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomText(
            product.name,
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
          8.verticalSpace,
          CustomText(
            "\$ ${product.price} / per pkg",
            fontSize: 18.sp,
          ),
          16.verticalSpace,
          ActionsSection(
            product: product,
          ),
          12.verticalSpace,
          const Divider(),
          16.verticalSpace,
          CustomText(product.description)
        ],
      ),
    );
  }
}

class ActionsSection extends StatelessWidget {
  const ActionsSection({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton.outlined(
                color: AppColors.onBgTextColor,
                onPressed: () {
                  context.read<ProudctQuantityCounterCubit>().increment();
                },
                icon: const Icon(
                  Icons.add,
                  color: AppColors.onBgTextColor,
                )),
            4.horizontalSpace,
            BlocBuilder<ProudctQuantityCounterCubit,
                ProudctQuantityCounterState>(
              builder: (context, state) {
                return CustomText(
                  state.kgs.toString(),
                  fontWeight: FontWeight.w600,
                  fontSize: 30.sp,
                );
              },
            ),
            4.horizontalSpace,
            IconButton.outlined(
                onPressed: () {
                  context.read<ProudctQuantityCounterCubit>().decrement();
                },
                icon: const Icon(Icons.remove))
          ],
        ),
        IconButton.filled(
            color: AppColors.primaryColor,
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    AppColors.onBgTextColor.withOpacity(.1))),
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined))
      ],
    );
  }
}
