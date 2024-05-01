import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,  this.width, required this.height,
  });
  final double? width ; 
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),height: height,width: width,);
  }
}