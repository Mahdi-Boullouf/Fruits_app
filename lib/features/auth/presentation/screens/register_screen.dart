import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/core/ui/widgets/input_field.dart';
import 'package:fruit_animations_app/core/utils/values.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              80.verticalSpace,
              SvgPicture.asset(
                AssetsManager.logo,
                width: 150.w,
              ),
              16.verticalSpace,
              CustomText(
                "Create New Account",
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

                     16.verticalSpace,
                  CustomText("Password Confirm :"),
                  12.verticalSpace,
                  InputField.password(
                    
                    controller: TextEditingController(),
                    label: "*********",
                  ),
                  32.verticalSpace,
                  FilledButton(
                      onPressed: () {},
                      child: CustomText(
                        "Create Account",
                        fontSize: 16.sp,
                        color: AppColors.onPrimaryColor,
                      )),

                      32.verticalSpace,
                      CustomText("Already have an account ?",textAlign: TextAlign.center, color: AppColors.secondaryColor,fontWeight: FontWeight.w700,fontSize: 16.sp,),
                      8.verticalSpace,
                                          CustomText("Sign In",textAlign: TextAlign.center, color: AppColors.secondaryColor,fontWeight: FontWeight.w700,fontSize: 16.sp,),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
