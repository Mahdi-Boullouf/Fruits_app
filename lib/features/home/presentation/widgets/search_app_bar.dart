import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/products_search_cubit.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';



class SearchingAppBar extends StatefulWidget {
  const SearchingAppBar({super.key});

  @override
  State<SearchingAppBar> createState() => _SearchingAppBarState();
}

class _SearchingAppBarState extends State<SearchingAppBar> {
    Timer? _debounce;


     void _onSearchChanged(String query) {
      context.read<ProductsSearchCubit>().emitLoadingStateUntilUserFinishesTyping();
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(seconds: 1), () {
      context.read<ProductsSearchCubit>().searchProducts(query);

    });
  }
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
  final focusNode=  FocusNode();
  return 
  
  
  TweenAnimationBuilder(
    duration: const Duration(milliseconds: 300),

    tween: Tween<double>(begin: 0.h,end: 100.h),
    
    builder: (context, value, child) {
    return  SizedBox(height: value,child:
  
  AppBar(
    surfaceTintColor: AppColors.backgroundColor,
    toolbarHeight: 80.h,
    actions: [IconButton(onPressed: () {
      context.read<ProductsSearchCubit>().stopSearching();
      context.read<ProductsCubit>().getProducts();
    }, icon: const Icon(Icons.close,color: Colors.black,))],
    title: TextField(
      focusNode: focusNode,
      onChanged: (value) =>  _onSearchChanged(value),
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search ..',
      prefixIcon: const Icon(Icons.search,color: AppColors.primaryColor,),
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h)),
    ),
    centerTitle: true,
  ));
  });
}}