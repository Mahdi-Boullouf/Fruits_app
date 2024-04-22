import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) => context.router.replaceAll([LoginRoute()]));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: AnimationConfiguration.toStaggeredList(childAnimationBuilder:(p0) {
            return ScaleAnimation(child: p0);
          } , children:  [
            SvgPicture.asset(AssetsManager.logo,width: 150.w,),
            16.verticalSpace,
            CustomText(
              'Your best marketplace for your fruit',
              fontSize: 16.sp,textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    ));
  }
}
