import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fruit_animations_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:fruit_animations_app/features/home/presentation/screens/home_screen.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});
  final List<Widget> tabs = [HomeScreen(),CartScreen()];
  @override
  Widget build(BuildContext context) {
    return   AutoTabsScaffold(

homeIndex: 0,
bottomNavigationBuilder: (context, tabsRouter) {
  return CustomBottomNavigationBar();
},
    );
    
  }
}