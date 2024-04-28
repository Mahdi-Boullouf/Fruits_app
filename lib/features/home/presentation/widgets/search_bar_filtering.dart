import 'package:flutter/material.dart';
import 'package:fruit_animations_app/core/res/app_colors.dart';
import 'package:fruit_animations_app/core/ui/components/custom_text.dart';

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
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.primaryColor,
                ))
          ],
        )
      ],
    );
  }
}
