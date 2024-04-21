import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';
import 'package:fruit_animations_app/features/home/domain/entities/category.dart';
import 'package:fruit_animations_app/features/products/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
   ProductCard({super.key, required this.productModel,  required this.category});
  final ProductModel productModel;
  final Category category; 

  var  colors = [Colors.red,Colors.orange,Colors.green];
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        Image.asset(
                          productModel.image,
                          height: 170.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Column(
                      
                      children: [
                        10.verticalSpace,
                        Container(
                          margin: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                              color: colors[Random().nextInt(2)],
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                           category.image,
                                width: 24.w,
                                
                                color: Colors.white,
                              ),4.horizontalSpace,
                              CustomText(
                           category.name,
                                fontSize: 11.sp,
                                color: AppColors.onPrimaryColor,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
            8.verticalSpace,
            CustomText(
              productModel.name,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            8.verticalSpace,
            CustomText(
              "RM 10.00 / per pkg",
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
                  child: Icon(
                    Icons.add_card_outlined,
                    color: AppColors.onPrimaryColor,
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
