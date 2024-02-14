import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const CustomShimmer({
    super.key,
    required this.height,
    double? width,
    double? borderRadius,
  })  : borderRadius = borderRadius ?? 0,
        width = width ?? 100;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.red),
      ),
    );
  }
}
