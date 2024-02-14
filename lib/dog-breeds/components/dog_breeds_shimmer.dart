import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';

class DogBreedsShimmer extends StatelessWidget {
  const DogBreedsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, __) => const CustomShimmer(
        height: 75,
        borderRadius: 10,
      ).padB(10),
      itemCount: 10,
    );
  }
}
