import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/features/home/domain/usecases/search_products.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/products_search_cubit.dart';

class SearchBarFiltering extends StatelessWidget {
  const SearchBarFiltering({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomText(
          "Result : ",
          fontWeight: FontWeight.w600,
        ),
         BlocBuilder<ProductsSearchCubit, ProductsSearchState>(
                  builder: (context, state) {
                    if(state is ProductsSearchInitial ){
   return    Row(
          children: [
            IconButton(
                onPressed: () {
                  context.read<ProductsSearchCubit>().startSearching();
                },
                icon: const Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                )),
         
          ],
        );

                    }
                    return const SizedBox();
                  },
         )   
      ],
    );
  }
}
