import 'package:flutter/material.dart';
import 'package:flutter_projects/shopicon/presentation/pages/cart.dart';
import 'package:flutter_projects/shopicon/presentation/pages/categories.dart';
import 'package:flutter_projects/shopicon/presentation/pages/home/home.dart';
import 'package:flutter_projects/shopicon/presentation/providers/shopicon_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Shopicon extends ConsumerWidget {
  Shopicon({super.key});
  final _tabs = [const Home(), const Categories(), const Cart()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentTab = ref.watch(providerOfCurrentTab);

    return Scaffold(
      body: _tabs[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        onTap: (int index) =>
            ref.read(providerOfCurrentTab.notifier).state = index,
        enableFeedback: true,
        iconSize: 20,
        elevation: 3,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          color: Colors.black45,
        ),
        currentIndex: currentTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
