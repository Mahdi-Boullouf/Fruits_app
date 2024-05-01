import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/core/ui/widgets/input_field.dart';
import 'package:fruit_animations_app/core/ui/widgets/loading_button.dart';
import 'package:fruit_animations_app/core/utils/utils.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/auth/presentation/cubit/auth_cubit.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = "mahdi.boullouf@gmail.com";
    passwordController.text = "123456789";

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomText("Email Address :"),
                      12.verticalSpace,
                      InputField.email(
                        controller: emailController,
                        label: "Enter Your email Address",
                      ),
                      16.verticalSpace,
                      const CustomText("Password :"),
                      12.verticalSpace,
                      InputField.password(
                        controller: passwordController,
                        label: "*********",
                      ),
                      32.verticalSpace,
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if(state is SignedInSuccesfuly){
                            context.router.replaceAll([const HomeRoute()]);
                            
                          }else if(state is AuthError){
                            Utils.showFlushBar(context, state.message);
                          }
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if(state is LoadingAuth){
                          return  const LoadingButton();
                          }
                          return FilledButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                      emailController.text,
                                      passwordController.text);
                                }
                              },
                              child: CustomText(
                                "Sign in Now",
                                fontSize: 16.sp,
                                color: AppColors.onPrimaryColor,
                              ));
                        },
                      ),
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
                            context.router.push(const RegisterRoute());
                          },
                          child: CustomText(
                            "Create Now",
                            textAlign: TextAlign.center,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
