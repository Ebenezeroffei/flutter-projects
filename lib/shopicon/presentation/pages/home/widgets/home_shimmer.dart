import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Super Deals
        const CustomShimmer(
          height: 25,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const CustomShimmer(
                height: 120,
                width: 120,
                borderRadius: 5,
              ).padR(10),
              const CustomShimmer(
                height: 120,
                width: 120,
                borderRadius: 5,
              ).padR(10),
              const CustomShimmer(
                height: 120,
                width: 120,
                borderRadius: 5,
              ).padR(10),
            ],
          ),
        ).padY(10),
        // More to love
        const CustomShimmer(
          height: 25,
        ).padT(20),
        GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: List.generate(
            10,
            (index) => const CustomShimmer(
              height: 200,
              borderRadius: 5,
            ),
          ),
        ).padT(10),
      ],
    ).pad(10);
  }
}
