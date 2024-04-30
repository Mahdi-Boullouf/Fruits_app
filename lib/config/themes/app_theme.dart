import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      useMaterial3: true,
      fontFamily: AppStrings.appFont,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5)),
          filled: true,
          fillColor: AppColors.onBgTextColor.withOpacity(.1)),
      filledButtonTheme: FilledButtonThemeData(
        
          style: ButtonStyle(
          
            padding: MaterialStatePropertyAll( EdgeInsets.symmetric(vertical: 16.h)),
              backgroundColor:
                  const MaterialStatePropertyAll(AppColors.primaryColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11))))));
}
