import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_refresh.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';
import 'package:flutter_projects/shopicon/presentation/pages/categories/widgets/categories_shimmer.dart';
import 'package:flutter_projects/shopicon/presentation/pages/categories/widgets/category_item.dart';
import 'package:flutter_projects/shopicon/presentation/providers/shopicon_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Categories extends ConsumerWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(providerOfGetCategories);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: categories.isLoading
          ? const CategoriesShimmer()
          : categories.when(
              data: (data) {
                return CustomScrollView(
                  slivers: [
                    SliverList.separated(
                      itemBuilder: (_, index) => CategoryItem(data[index]),
                      separatorBuilder: (_, __) => const Divider(
                        thickness: 8,
                        color: Colors.white,
                      ),
                      itemCount: data.length,
                    ),
                  ],
                ).pad(10);
              },
              error: (_, __) => CustomRefresh(
                  onClickHandler: () =>
                      ref.invalidate(providerOfGetCategories)),
              loading: () => const CategoriesShimmer(),
            ),
    );
  }
}
