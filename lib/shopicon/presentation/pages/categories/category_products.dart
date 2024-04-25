import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_projects/core/components/custom_refresh.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/shopicon/presentation/pages/categories/widgets/category_products_shimmer.dart';
import 'package:flutter_projects/shopicon/presentation/pages/home/widgets/product_item.dart';
import 'package:flutter_projects/shopicon/presentation/providers/shopicon_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryProducts extends ConsumerWidget {
  final String category;

  const CategoryProducts({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProducts = ref.watch(
      providerOfCategoryProducts(category.toLowerCase()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: categoryProducts.isLoading
          ? const CategoryProductsShimmer()
          : categoryProducts.when(
              data: (data) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Total: ${data.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ).padB(10),
                    ),
                    SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        mainAxisExtent: 200,
                      ),
                      itemBuilder: (_, index) => ProductItem(item: data[index]),
                      itemCount: data.length,
                    )
                  ],
                ).pad(10);
              },
              error: (_, __) {
                return CustomRefresh(
                  onClickHandler: () =>
                      ref.invalidate(providerOfCategoryProducts),
                );
              },
              loading: () => const CategoryProductsShimmer()),
    );
  }
}
