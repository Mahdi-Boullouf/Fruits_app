import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';
import 'package:fruit_animations_app/core/ui/components/input_field.dart';
import 'package:fruit_animations_app/core/utils/values.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: paddingMargin),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              150.verticalSpace,
              SvgPicture.asset(
                AssetsManager.logo,
                width: 150.w,
              ),
              16.verticalSpace,
              CustomText(
                "Sign In",
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              16.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText("Email Address :"),
                  12.verticalSpace,
                  InputField.email(
                    controller: TextEditingController(),
                    label: "Enter Your email Address",
                  ),
                  16.verticalSpace,
                  CustomText("Password :"),
                  12.verticalSpace,
                  InputField.password(
                    controller: TextEditingController(),
                    label: "*********",
                  ),
                  32.verticalSpace,
                  FilledButton(
                      onPressed: () {
                        context.router.replaceAll([HomeRoute()]);
                      },
                      child: CustomText(
                        "Sign in Now",
                        fontSize: 16.sp,
                        color: AppColors.onPrimaryColor,
                      )),
                  32.verticalSpace,
                  CustomText(
                    "Dont you have an account ?",
                    textAlign: TextAlign.center,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                  8.verticalSpace,
                  InkWell(
                      onTap: () {
                        context.router.push(RegisterRoute());
                      },
                      child: CustomText(
                        "Create Now",
                        textAlign: TextAlign.center,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
