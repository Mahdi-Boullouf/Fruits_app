import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';

import '../../domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.isSelected, required this.category});
  final bool isSelected;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:62.w ,
      height: 62.w,
      decoration: BoxDecoration(color: isSelected ?  AppColors.primaryColor : AppColors.onBgTextColor.withOpacity(.1),borderRadius: BorderRadius.circular(11)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SvgPicture.asset(category.image,colorFilter:  ColorFilter.mode(isSelected ? AppColors.onPrimaryColor : AppColors.onBgTextColor, BlendMode.srcIn) ,),
        CustomText(category.name,fontSize: 12.sp,color: isSelected ? AppColors.onPrimaryColor : AppColors.onBgTextColor,)
      ],),
    );
  }
}