import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_animations_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:fruit_animations_app/features/home/presentation/screens/home_screen.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
   const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> tabs = [HomeScreen(),CartScreen()];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsCubit>().getProducts();
    context.read<CategoriesCubit>().getCategories();

  }
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