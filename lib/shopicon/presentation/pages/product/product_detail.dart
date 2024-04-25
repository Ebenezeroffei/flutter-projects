import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_projects/core/components/custom_button.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/presentation/pages/product/widgets/product_detail_ratings.dart';
import 'package:flutter_projects/shopicon/presentation/pages/product/widgets/product_detail_slider.dart';
import 'package:flutter_projects/shopicon/presentation/utils/shopicon_utils.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> quantity = ValueNotifier(1);
    final ValueNotifier<bool> isButtonLoading = ValueNotifier(false);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              backgroundColor: Colors.white,
              pinned: false,
              floating: false,
              snap: false,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: ProductDetailSlider(product.images),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ).centerLeft(),
                    Text(
                      product.brand,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ).centerLeft().pad(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductDetailRatings(product.rating),
                        Text(
                          "GHS ${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ).pad(10),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // Description
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ).centerLeft(),
                      Text(
                        product.description,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ).centerLeft().padT(5),
                    ]).pad(10),
                  ),
                  // Quantity
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(children: [
                      const Text(
                        "Quantity",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ).centerLeft(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () =>
                                quantity.value > 1 ? quantity.value-- : null,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: quantity,
                            builder: (context, _, __) => Text(
                              quantity.value.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => quantity.value++,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        ],
                      ).padT(10)
                    ]).pad(10),
                  ).padT(10),
                  ValueListenableBuilder(
                    valueListenable: isButtonLoading,
                    builder: (_, __, ___) => isButtonLoading.value
                        ? CustomButton.loading().padT(15)
                        : CustomButton.text(
                            "Add to Cart",
                            () => ShopiconUtils.addToCart(quantity.value,
                                product, isButtonLoading, context),
                          ).padT(15),
                  )
                  // Add to Cart
                ],
              ).pad(10),
            ),
          ],
        ),
      ),
    );
  }
}
