import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, __) => const CustomShimmer(
        height: 50,
        borderRadius: 5,
      ),
      separatorBuilder: (_, __) => const Divider(
        height: 8,
        color: Colors.white,
      ),
      itemCount: 15,
    ).pad(10);
  }
}
