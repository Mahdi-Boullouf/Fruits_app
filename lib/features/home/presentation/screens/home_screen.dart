import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/categories_build.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/products_build.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/search_bar_filtering.dart';
import 'package:fruit_animations_app/features/products/data/models/product_model.dart';


@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   List<ProductModel> products = [];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: paddingMargin),
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: AnimationConfiguration.toStaggeredList(childAnimationBuilder:     (widget) => SlideAnimation(
                duration: const Duration(milliseconds: 300),
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  
                  child: widget,
                ),
              ), children:  [
                const CategoriesBuild(),
                16.verticalSpace,
                const SearchBarFiltering(),
                16.verticalSpace,
                ProductsBuild()
              ],
            ),
          )),
        ),
      ),
    );
  }
}


