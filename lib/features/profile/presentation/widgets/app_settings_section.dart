
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/core/utils/utils.dart';
import 'package:fruit_animations_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:fruit_animations_app/features/profile/presentation/widgets/profile_item.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppSettingsSection extends StatelessWidget {
  const AppSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText("App",fontWeight: FontWeight.bold,fontSize: 18.sp,),
        8.verticalSpace,
                 ProfileItem(title: "Change Language", onClick: (){
                      Utils.showFlushBar(context, "This feature has not implemented yet");
                 }, iconData: Icons.language_outlined)
        ,
        
                           ProfileItem(title: "Theme", onClick: (){
                                Utils.showFlushBar(context, "This feature has not implemented yet");
                           }, iconData: Icons.light_mode_outlined),
        
                          ProfileItem(title: 'Rate Us', onClick: (){
                            // launchurl google play ..
                                Utils.showFlushBar(context, "This app has not uploaded to google play yet . so you cannot rate it :)");
                          }, iconData: Icons.star_outline_rounded),
                   ProfileItem(title: 'Contact Us',iconData: Icons.phone,onClick: () {
                      // launch url  contact us link
                      launchUrlString('mailto:mahdi.boullouf@gmail.com');
                   },),
      ],
    );
  }
}