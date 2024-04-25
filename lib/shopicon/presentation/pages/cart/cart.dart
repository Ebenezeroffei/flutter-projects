import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_button.dart';
import 'package:flutter_projects/core/components/custom_refresh.dart';
import 'package:flutter_projects/core/components/custom_snackbar.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/core/utils/misc_utils.dart';
import 'package:flutter_projects/shopicon/presentation/pages/cart/widgets/cart_item.dart';
import 'package:flutter_projects/shopicon/presentation/pages/cart/widgets/cart_shimmer.dart';
import 'package:flutter_projects/shopicon/presentation/providers/shopicon_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Cart extends ConsumerWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(providerOfCart);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cartProvider.isLoading
          ? const CartShimmer()
          : cartProvider.when(
              data: (data) {
                double total = 0;

                return data.length > 0
                    ? Column(
                        children: [
                          Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              children: data.values.map((e) {
                                total += e.product.price * e.quantity;
                                return CartItem(e);
                              }).toList(),
                            ).pad(10),
                          ),
                          // Total
                          Container(
                            color: Colors.grey.shade300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total:",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "GHC ${total.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ).pad(10),
                          ),
                          // Checkout
                          TextButton(
                            onPressed: () => MiscUtils.showSnackBar(
                              context,
                              CustomSnackBar.primary(
                                  context, "You have been checked out"),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              minimumSize: const Size(double.infinity, 50),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.zero,
                                ),
                              ),
                            ),
                            child: const Text("CHECKOUT"),
                          ),
                        ],
                      )
                    : const Center(
                        child: Text(
                          "No Items Added To Cart",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ).pad(10);
              },
              error: (_, __) => CustomRefresh(
                  onClickHandler: () => ref.invalidate(providerOfCart)),
              loading: () => const CartShimmer(),
            ),
    );
  }
}
