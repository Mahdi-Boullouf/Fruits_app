
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';

AppBar customAppBar() {
    return AppBar(
      surfaceTintColor: AppColors.backgroundColor,
      toolbarHeight: 100.h,
      title: Column(
        children: [
          SvgPicture.asset(AssetsManager.logo),
          4.verticalSpace,
            const CustomText(
          'Your best marketplace for your fruit',
       textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        )
        ],
      ),
      centerTitle: true,
    );
  }
