import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';
import 'package:fruit_animations_app/core/app/injector.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';
import 'package:fruit_animations_app/core/ui/components/shimmer_widget.dart';
import 'package:fruit_animations_app/core/utils/values.dart';
import 'package:fruit_animations_app/features/cart/presentation/cubit/cart_cubit.dart';
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
                CustomText(
                  "Items (3)",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                48.verticalSpace,
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartItemsLoaded) {
                      return ListView.builder(
                        itemCount: state.demands.length,
                        itemBuilder: (context, index) => BlocProvider(
                          create: (context) => injector.get<ProductsCubit>(),
                          child: CartItemCard(
                            demand: state.demands[index],
                          ),
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: paddingMargin,
          right: paddingMargin,
          top: 8.h,
          bottom: 4.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Subtotal : ",
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  "\$34",
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Tax : ",
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  "\$5",
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            4.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Grande Total : ",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  "\$39",
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ],
            ),
            16.verticalSpace,
            FilledButton(
                onPressed: () {
                  context.router.push(const CheckoutRoute());
                },
                child: const CustomText(
                  "Checkout",
                  color: AppColors.onPrimaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
