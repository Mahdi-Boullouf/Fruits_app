import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/ui/widgets/shimmer_widget.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/products_filter_cubit.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/category_card.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';

class CategoriesBuild extends StatelessWidget {
  const CategoriesBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CatgeoriesLoaded) {
          return SizedBox(
              height: 62.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    state.categories.length,
                    (index) => Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: BlocConsumer<ProductsFilterCubit, ProductsFilterState>(
                          listener: (context, state) {
                            if(state is ProductFiltredByCategoryChanged){
                              context.read<ProductsCubit>().getProducts(category:  state.category);
                            }
                          },
                          builder: (context, state1) {
                            return GestureDetector(
                              onTap: () {
                                context.read<ProductsFilterCubit>().changeCategory(state.categories[index].name);
                              },
                              child: CategoryCard(
                                  isSelected:state.categories[index].name == state1.category,
                                  category: state.categories[index]),
                            );
                          },
                        ))),
              ));
        } else if (state is CategoriesLoading) {
          return SizedBox(
              height: 62.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    6,
                    (index) => Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: ShimmerCard(
                          height: 62.h,
                          width: 62.h,
                        ))),
              ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
