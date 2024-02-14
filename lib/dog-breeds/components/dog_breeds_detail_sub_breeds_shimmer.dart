import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';

class DogBreedsDetailSubBreedsShimmer extends StatelessWidget {
  const DogBreedsDetailSubBreedsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const CustomShimmer(
              width: 50,
              height: 25,
              borderRadius: 4,
            ).padR(5),
            const CustomShimmer(
              width: 50,
              height: 25,
              borderRadius: 4,
            ).padR(5),
            const CustomShimmer(
              width: 50,
              height: 25,
              borderRadius: 4,
            ).padR(5),
            const CustomShimmer(
              width: 50,
              height: 25,
              borderRadius: 4,
            ).padR(5),
          ],
        ),
      ),
    );
  }
}
