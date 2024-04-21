
import 'package:auto_route/auto_route.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
 CustomBottomNavigationBar({super.key});
List<TabItem> items = [
  const TabItem(
    icon: Icons.home,
    title: 'Home',
  ),

  const TabItem(
    icon: Icons.shopping_cart_outlined,
    title: 'Cart',
  ),

  const TabItem(
    icon: Icons.account_box,
    title: 'profile',
  ),
];
  @override
  Widget build(BuildContext context) {
    return   ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: BottomBarCreative(
        
                  items: items,
                  backgroundColor: AppColors.backgroundColor,
                  color: AppColors.onBgTextColor,
                  colorSelected: AppColors.primaryColor,
                  indexSelected: context.tabsRouter.activeIndex,
                  isFloating: true,
                  highlightStyle: HighlightStyle(sizeLarge: true, isHexagon: true, elevation: 2),
                  onTap: (int index){
                    print(index);
                    context.tabsRouter.setActiveIndex(index);
                  },
                ),
      ),
    );
  }
}