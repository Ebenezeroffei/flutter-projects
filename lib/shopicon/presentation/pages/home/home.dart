import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_refresh.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/presentation/pages/home/widgets/home_shimmer.dart';
import 'package:flutter_projects/shopicon/presentation/pages/home/widgets/more_to_love.dart';
import 'package:flutter_projects/shopicon/presentation/pages/home/widgets/super_deals.dart';
import 'package:flutter_projects/shopicon/presentation/providers/shopicon_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(providerOfGetProducts);

    return Scaffold(
      // body: ListView(
      //   children: <Widget>[
      //     SuperDeals(items: []),
      //     MoreToLove(items: []),

      //   ],
      // ).pad(10),
      body: products.isLoading
          ? HomeShimmer()
          : products.when(
              data: (data) {
                final List<Product> superDealsItems = [];
                final List<Product> moreToLoveItems = [];
                for (int i = 0; i < data.length; i++) {
                  i < 10
                      ? superDealsItems.add(data[i])
                      : moreToLoveItems.add(data[i]);
                }
                return SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SuperDeals(items: superDealsItems),
                      ),
                      const SliverToBoxAdapter(
                        child: Text(
                          "More To Love",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      MoreToLove(items: moreToLoveItems),
                    ],
                  ).pad(10),
                );
              },
              error: (_, __) => CustomRefresh(
                  onClickHandler: () => ref.invalidate(providerOfGetProducts)),
              loading: () => const HomeShimmer(),
            ),
    );
  }
}
