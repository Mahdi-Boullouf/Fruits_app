import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_animations_app/core/app/injector.dart';
import 'package:fruit_animations_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fruit_animations_app/features/home/domain/usecases/search_products.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/products_filter_cubit.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/products_search_cubit.dart';
import 'package:fruit_animations_app/features/products/data/repo/products_repo_impl.dart';
import 'package:fruit_animations_app/features/products/domain/repos/products_repo.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_product.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/proudct_quantity_counter_cubit.dart';

class DI extends StatelessWidget {
  const DI({super.key, required this.app});
  final Widget app;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector.get<CategoriesCubit>(),
        ),
        BlocProvider(create: (context) => injector.get<ProductsCubit>(),),
        BlocProvider(create: (context) => injector.get<CartCubit>(),),

        BlocProvider(create: (context) => ProductsFilterCubit(),),
        BlocProvider(create: (context) => ProudctQuantityCounterCubit(),),
        BlocProvider(create: (context) => injector.get<ProductsSearchCubit>(),)


     
      ],
      child: app,
    );

  }
}