import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_confirm_dialogue.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/shopicon/domain/entities/cart.dart';
import 'package:flutter_projects/shopicon/presentation/utils/shopicon_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartItem extends ConsumerWidget {
  final Cart cart;

  const CartItem(this.cart, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async => await Navigator.pushNamed(
                  context,
                  '/products/detail',
                  arguments: cart.product,
                ),
                child: CachedNetworkImage(
                  imageUrl: cart.product.thumbnail,
                  width: 80,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: mediaQuery.size.width - 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async => await Navigator.pushNamed(
                        context,
                        '/products/detail',
                        arguments: cart.product,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cart.product.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            cart.product.brand,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "GHC ${cart.product.price.toStringAsFixed(2)}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton.icon(
                          onPressed: () async => await showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return CustomConfirmDialogue(
                                title: "Delete Item From Cart",
                                message:
                                    "Are you sure you want to delete this item from the cart?",
                                onNoResponse: () {},
                                onYesResponse: () async =>
                                    ShopiconUtils.removeItemFromCart(
                                  ref,
                                  context: context,
                                  productId: cart.product.id,
                                ),
                              );
                            },
                          ),
                          icon: const Icon(
                            Icons.delete,
                            size: 15,
                          ),
                          label: const Text(
                            "Delete",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            minimumSize: const Size(80, 30),
                            elevation: 0,
                            padding: const EdgeInsets.all(0),
                            foregroundColor: Colors.red.shade600,
                          ),
                        )
                      ],
                    ),
                  ],
                ).padL(8),
              ),
            ],
          ).padR(10),
          // Modify quantity
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => ShopiconUtils.modifyCartQuantity(
                  cart.id,
                  ref: ref,
                  increase: true,
                ),
                child: const SizedBox(
                  width: 22,
                  height: 22,
                  child: Icon(
                    Icons.add,
                    size: 18,
                  ),
                ),
              ),
              Text(
                cart.quantity.toString(),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => ShopiconUtils.modifyCartQuantity(
                  cart.id,
                  ref: ref,
                  increase: false,
                ),
                child: const SizedBox(
                  width: 22,
                  height: 22,
                  child: Icon(
                    Icons.remove,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ).pad(5),
    ).padB(10);
  }
}
