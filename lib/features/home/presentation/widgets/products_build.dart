import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_animations_app/core/ui/widgets/loading_widget.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:fruit_animations_app/features/products/presentation/widgets/product_card.dart';

class ProductsBuild extends StatelessWidget {
  ProductsBuild({
    super.key,
  });
  final products = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {


if(state is ProductsLoaded){
  if(state.products.isEmpty){
    return const Text("No products");
  }
return    GridView.builder(
          itemCount: state.products.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              mainAxisExtent: 250.h,
              crossAxisCount: 2),
          itemBuilder: (context, index) => ProductCard(
            product: state.products[index],
          ),
        );
}
else if (state is ProductsLoading){
 return const Column(
    children: [
      LoadingWidget(),
    ],
  );

}else if(state is ProductsError){
  return Text("Error : ${state.message}");
}
else{
  return const SizedBox();
}



      
      },
    );
  }
}
