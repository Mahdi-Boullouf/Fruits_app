import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/config/router/app_router.dart';
import 'package:fruit_animations_app/config/themes/app_theme.dart';
import 'package:fruit_animations_app/core/app/di.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});
final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return  DI(app: ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: false,
      minTextAdapt: true,
      builder:(context, child) =>  MaterialApp.router(
        routerConfig: appRouter.config(),
      
      
      theme: appTheme(),      
      ),
    ),);
  }
}