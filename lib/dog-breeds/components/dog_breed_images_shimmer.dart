import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';

class DogBreedImagesShimmer extends StatelessWidget {
  const DogBreedImagesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const CustomShimmer(
              height: 100,
            ),
            childCount: 30,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        ),
      ],
    );
  }
}
