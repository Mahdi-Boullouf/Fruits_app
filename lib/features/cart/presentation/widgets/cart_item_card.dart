import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Image.asset(
          AssetsManager.orangeImage,
          width: 52.w,
          height: 53.h,
          fit: BoxFit.fitHeight,
        ),
      ),
      title: CustomText(
        "Orange",
        fontSize: 18.sp,
      ),
      subtitle: CustomText("RM 10.00 / per pkg"),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: AppColors.primaryColor,
        ),
        child: Center(
            child: CustomText(
          "1",
          fontSize: 18.sp,
          color: AppColors.onPrimaryColor,
        )),
        width: 34.w,
        height: 37.h,
      ),
      contentPadding: EdgeInsets.only(bottom: 12.h),
      shape: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.onBgTextColor.withOpacity(.35))),
    );
  }
}
