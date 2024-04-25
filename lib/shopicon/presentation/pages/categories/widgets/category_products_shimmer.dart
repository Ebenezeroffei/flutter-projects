import 'package:flutter/widgets.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';

class CategoryProductsShimmer extends StatelessWidget {
  const CategoryProductsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
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
    ).pad(10);
  }
}
