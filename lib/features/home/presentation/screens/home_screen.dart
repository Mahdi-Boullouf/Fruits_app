import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/annotations.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/home/data/models/category_model.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/category_card.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:fruit_animations_app/features/products/data/models/product_model.dart';
import 'package:fruit_animations_app/features/products/domain/entities/product.dart';
import 'package:fruit_animations_app/features/products/presentation/widgets/product_card.dart';

import '../../domain/entities/category.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = [
    CategoryModel(name: 'All', id: '0', image: AssetsManager.all),
    CategoryModel(name: 'Apple', id: '0', image: AssetsManager.apple),
    CategoryModel(name: 'Banana', id: '0', image: AssetsManager.banana),
    CategoryModel(name: 'Blueberry', id: '0', image: AssetsManager.blueBerry),
    CategoryModel(name: 'Mango', id: '0', image: AssetsManager.mango),
    CategoryModel(name: 'Orange', id: '0', image: AssetsManager.orange)
  ];
  List<ProductModel> products = [ProductModel(name: "Apple", rm: 10.0, image: AssetsManager.appleImage, id: '0'),
  
  ProductModel(name: "Orange", rm: 10.0, image: AssetsManager.orangeImage, id: '1',),
    ProductModel(name: "Mango", rm: 10.0, image: AssetsManager.mangoImage, id: '2',)
  ];
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
                duration: Duration(milliseconds: 300),
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  
                  child: widget,
                ),
              ), children:  [
                CategoriesBuild(categories: categories),
                16.verticalSpace,
                SearchBarFiltering(),
                16.verticalSpace,
                GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    mainAxisExtent: 250.h,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => ProductCard(productModel: products[index],category: categories.singleWhere((element) => element.name == products[index].name),),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class SearchBarFiltering extends StatelessWidget {
  const SearchBarFiltering({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          "Result : ",
          fontWeight: FontWeight.w600,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: AppColors.primaryColor,
                ))
          ],
        )
      ],
    );
  }
}

class CategoriesBuild extends StatelessWidget {
  const CategoriesBuild({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 62.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              categories.length,
              (index) => Container(
                  margin: EdgeInsets.only(right: 8.w),
                  child: CategoryCard(
                      isSelected: index == 0, category: categories[index]))),
        ));
  }
}
