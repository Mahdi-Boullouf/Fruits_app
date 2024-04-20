import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),height: 100.h,);
  }
}