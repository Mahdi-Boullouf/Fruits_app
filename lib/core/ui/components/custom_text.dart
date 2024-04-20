
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/app_colors.dart';
import '../../res/app_strings.dart';


class CustomText extends StatelessWidget {
  const CustomText(this.text,{super.key,  this.fontName = AppStrings.appFont, this.color = AppColors.onBgTextColor,  this.fontSize ,  this.textAlign = TextAlign.start , this.fontWeight = FontWeight.normal,this.textOverflow = TextOverflow.visible,this.height});
  final String text;
  final Color color;
  final double? fontSize ;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final double? height; 
  final String? fontName;
  @override
  Widget build(BuildContext context) {
    return  Text(text,style: TextStyle(height: height, fontSize:  fontSize ?? 14.sp,color: color,fontWeight: fontWeight,fontFamily: fontName),textAlign: textAlign,overflow: textOverflow,maxLines: null);
  }
}