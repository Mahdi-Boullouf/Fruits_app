import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/core/utils/utils.dart';
import 'package:fruit_animations_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:fruit_animations_app/features/profile/presentation/widgets/profile_item.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText("Account",fontWeight: FontWeight.bold,fontSize: 18.sp,),
        8.verticalSpace,
    
       ProfileItem(title: "My Wallet", onClick: (){
        Utils.showFlushBar(context, "This feature has not implemented yet");
       }, iconData: Icons.wallet),
    ProfileItem(title: "Edit Account", onClick: (){
          Utils.showFlushBar(context, "This feature has not implemented yet");
    }, iconData: Icons.edit_outlined),
    
      ],
    );
  }
}