import 'package:flutter/material.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  LottieBuilder.asset(AssetsManager.loadingAnimation);
  }
}