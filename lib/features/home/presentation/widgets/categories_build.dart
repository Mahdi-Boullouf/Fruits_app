import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/features/home/domain/entities/category.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/category_card.dart';

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
