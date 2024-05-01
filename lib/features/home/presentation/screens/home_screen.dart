import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fruit_animations_app/core/ui/widgets/loading_widget.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/products_search_cubit.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/categories_build.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/products_build.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/search_app_bar.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/search_bar_filtering.dart';
import 'package:fruit_animations_app/features/products/data/models/product_model.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  List<ProductModel> products = [];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: BlocBuilder<ProductsSearchCubit, ProductsSearchState>(
          builder: (context, state) {
            if (state is! ProductsSearchInitial) {
              return const SearchingAppBar();
            } else {
              return const NormalAppBar();
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: paddingMargin),
          child: AnimationLimiter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: AnimationConfiguration.toStaggeredList(
              childAnimationBuilder: (widget) => SlideAnimation(
                duration: const Duration(milliseconds: 300),
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                BlocConsumer<ProductsSearchCubit, ProductsSearchState>(
                  listener: (context, state) {
                    if (state is ProductSearhSubmitted) {
                      context
                          .read<ProductsCubit>()
                          .getProducts(query: state.query);
                    }
                  },
                  builder: (context, state) {
                    if (state is ProductsSearchInitial) {
                      return const CategoriesBuild();
                    }
                    return const SizedBox();
                  },
                ),
                16.verticalSpace,
                const SearchBarFiltering(),
                16.verticalSpace,
                BlocBuilder<ProductsSearchCubit, ProductsSearchState>(
                  builder: (context, state) {
                    if(state is ProductsSearchLoading){
                      return const Column(
                        children: [
                          LoadingWidget(),
                        ],
                      );
                    }
                    return ProductsBuild();
                  },
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
