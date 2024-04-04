import 'package:flutter/material.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/presentation/pages/home/widgets/product_item.dart';

class MoreToLove extends StatelessWidget {
  final List<Product> items;
  const MoreToLove({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        mainAxisExtent: 200,
      ),
      itemBuilder: (_, index) => ProductItem(item: items[index]),
      itemCount: items.length,
    );
  }
}
