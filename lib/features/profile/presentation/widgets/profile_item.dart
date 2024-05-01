
import 'package:flutter/material.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key, required this.title, required this.onClick, required this.iconData,
  });
  final String title;
  final Function() onClick ;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: () => onClick(),
      leading: Icon(iconData),title: CustomText(title),trailing: Padding(
       padding: EdgeInsets.all(8.0),
       child: Icon(Icons.arrow_forward_ios_rounded,),
     ),);
  }
}
