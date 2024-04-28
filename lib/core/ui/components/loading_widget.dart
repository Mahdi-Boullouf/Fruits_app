import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Lottie.asset(AssetsManager.loadingAnimation,width: 80.w,frameRate: FrameRate.max,fit: BoxFit.cover);
  }
}