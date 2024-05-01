import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/core/utils/utils.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/profile/presentation/screens/profile_image_viewer.dart';
import 'package:fruit_animations_app/features/profile/presentation/widgets/account_settings_section.dart';
import 'package:fruit_animations_app/features/profile/presentation/widgets/app_settings_section.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      toolbarHeight: 80.h,
        title: CustomText(
          "Profile",
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: paddingMargin, ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileInfoBar(),
4.verticalSpace,

16.verticalSpace,
AccountSettingsSection(),

16.verticalSpace,
AppSettingsSection(),
            
          ],
        ),
      ),
    );
  }
}




class ProfileInfoBar extends StatelessWidget {
  const ProfileInfoBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GestureDetector(onTap: () {
     showDialog(context: context, builder: (context) => Container( margin: EdgeInsets.only(bottom: 150.h), padding: EdgeInsets.symmetric(horizontal: 16.w), child: Hero(tag: AssetsManager.avatar, child: CircleAvatar(backgroundImage: AssetImage(AssetsManager.avatar),))),);
        }, child: Hero(tag: AssetsManager.avatar, child: Image.asset(AssetsManager.avatar,height: 50.h,width: 50.h,fit: BoxFit.cover,))),
      ),
               
               title: const CustomText("Mahdi Boullouf"),
               subtitle:  CustomText("mahdi.boullouf@gmail.com",fontSize: 12.sp,color: AppColors.onBgTextColor.withOpacity(.6),),
   
   trailing: IconButton(onPressed: (){
    context.router.replaceAll([LoginRoute()]);
   }, icon:  const Icon(Icons.logout,color: AppColors.primaryColor,)),
    );
  }
}
