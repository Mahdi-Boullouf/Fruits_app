import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:lottie/lottie.dart';
@RoutePage()
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(

          padding:  EdgeInsets.symmetric(horizontal: paddingMargin),
          child: AnimationLimiter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:AnimationConfiguration.toStaggeredList(childAnimationBuilder:(p0) => SlideAnimation(child: p0,verticalOffset: 500.h,) ,children:[

                 Lottie.asset(AssetsManager.doneAnimation,width: 160.w),
              16.verticalSpace,
              CustomText("Order Succesful",color: AppColors.primaryColor,fontWeight: FontWeight.w500,fontSize: 24.sp,),
              8.verticalSpace,
              CustomText("Order ID : 0791468625",fontSize: 16.sp,),
              16.verticalSpace,
                    32.verticalSpace,
            
              Container(width: double.infinity, child: FilledButton(onPressed: (){}, child: CustomText("Show Receipt",color: AppColors.onPrimaryColor,)))
                    ,
                    32.verticalSpace,
                    CustomText("Back to home page",color: AppColors.secondaryColor,fontWeight: FontWeight.w600,fontSize: 16.sp,)
              ] ) ,),
          ),
        ),
      ),
    );
  }
}