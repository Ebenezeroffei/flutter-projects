import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, __) => const CustomShimmer(
        height: 100,
        borderRadius: 5,
      ).padB(10),
      itemCount: 10,
    ).pad(10);
  }
}
