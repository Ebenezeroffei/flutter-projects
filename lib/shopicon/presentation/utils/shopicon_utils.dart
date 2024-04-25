import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_snackbar.dart';
import 'package:flutter_projects/core/utils/misc_utils.dart';
import 'package:flutter_projects/shopicon/domain/entities/cart.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/presentation/providers/shopicon_providers.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopiconUtils {
  static addToCart(
    int quantity,
    Product product,
    ValueNotifier<bool> isButtonLoading,
    BuildContext context,
  ) async {
    isButtonLoading.value = true;
    await Hive.openBox<Cart>('cartBox');
    final cart = Hive.box<Cart>('cartBox');

    // Check if item exist
    final Cart? cartObj = cart.get(product.id);
    if (cartObj != null) {
      await cart.put(
        cartObj.id,
        Cart(
          id: cartObj.id,
          product: product,
          quantity: cartObj.quantity + quantity,
        ),
      );
    } else {
      await cart.put(
          product.id,
          Cart(
            id: product.id,
            product: product,
            quantity: quantity,
          ));
    }
    MiscUtils.showSnackBar(
        context, CustomSnackBar.primary(context, "Item added to cart"));
    isButtonLoading.value = false;
  }

  static removeItemFromCart(
    WidgetRef ref, {
    required context,
    required int productId,
  }) async {
    await Hive.openBox<Cart>('cartBox');
    final Box<Cart> cart = Hive.box<Cart>('cartBox');
    Cart? cartItem = cart.get(productId);
    if (cartItem != null) {
      cart.delete(productId);
      ref.invalidate(providerOfCart);
      MiscUtils.showSnackBar(
        context,
        CustomSnackBar.primary(
          context,
          "Item deleted successfully",
        ),
      );
    }
    await Hive.close();
  }

  static modifyCartQuantity(
    int productId, {
    required WidgetRef ref,
    required bool increase,
  }) async {
    await Hive.openBox<Cart>('cartBox');
    final Box<Cart> cart = Hive.box<Cart>('cartBox');
    Cart? cartItem = cart.get(productId);
    if (cartItem != null) {
      int modifiedQuantity = cartItem.quantity;
      if (!increase) {
        if (modifiedQuantity - 1 > 0) {
          modifiedQuantity--;
        } else {
          return;
        }
      } else {
        modifiedQuantity++;
      }
      cart.put(
        productId,
        Cart(
          id: productId,
          product: cartItem.product,
          quantity: modifiedQuantity,
        ),
      );
      ref.invalidate(providerOfCart);
    }
    await Hive.close();
  }
}
