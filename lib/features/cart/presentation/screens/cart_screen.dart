import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';
import 'package:fruit_animations_app/core/app/injector.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';
import 'package:fruit_animations_app/core/ui/widgets/custom_text.dart';
import 'package:fruit_animations_app/core/ui/widgets/shimmer_widget.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/cart/data/models/demand_model.dart';
import 'package:fruit_animations_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fruit_animations_app/features/cart/presentation/widgets/cart_bottom_info.dart';
import 'package:fruit_animations_app/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:fruit_animations_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartCubit>().getCartUserItems("mahdi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          "Cart",
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
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
                
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartItemsLoaded) {
                  if(state.demands.isEmpty){
                    return Column(
                      children: [
                        135.verticalSpace,
                        SvgPicture.asset(AssetsManager.noData,width: 150.w,),
                        16.verticalSpace,
                                    CustomText(
                                      "Items (${state.demands.length})",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                        // CustomText("You didn't add any demands"),
                                    
                      ],
                    );
                  }
                      return Column(
                        children: [
                          CustomText(
                  "Items (${state.demands.length})",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                48.verticalSpace,
                          ListView.builder(
                            itemCount: state.demands.length,
                            itemBuilder: (context, index) => BlocProvider(
                              create: (context) => injector.get<ProductsCubit>(),
                              child: CartItemCard(
                                demand: state.demands[index],
                              ),
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        ],
                      );
                    }
                    return ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          child: ShimmerCard(height: 70.h)),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  },
                )
              ],
            ),
          )),
        ),
      ),
      bottomNavigationBar: CartBottomInfo(),
    );
  }
}
