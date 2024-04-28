import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';
import 'package:fruit_animations_app/features/home/data/models/category_model.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  final Product product;

  var colors = [Colors.red, Colors.orange, Colors.green];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(ProductDetailsRoute(product: product));
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Hero(
                            tag: product.id,
                            child: Image.asset(
                              product.image,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  "https://picsum.photos/400/400",
                                  height: 170.h,
                                );
                              },
                              height: 170.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          10.verticalSpace,
                          CategoryIndicator(colors: colors, product: product)
                        ],
                      )
                    ],
                  )),
              8.verticalSpace,
              CustomText(
                product.name,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              8.verticalSpace,
              CustomText(
                "\$ ${product.price} / per pkg",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              130.verticalSpace,
              Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 26.r,
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: AppColors.onPrimaryColor,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryIndicator extends StatelessWidget {
  const CategoryIndicator({
    super.key,
    required this.colors,
    required this.product,
  });

  final List<MaterialColor> colors;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if(state is CatgeoriesLoaded){
return Container(
          margin: EdgeInsets.only(left: 8.w),
          decoration: BoxDecoration(
              color: colors[Random().nextInt(2)],
              borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            
              4.horizontalSpace,
              CustomText(
                product.category,
                fontSize: 11.sp,
                color: AppColors.onPrimaryColor,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        );
        }else{
          return SizedBox();
        }
        
      },
    );
  }
}
