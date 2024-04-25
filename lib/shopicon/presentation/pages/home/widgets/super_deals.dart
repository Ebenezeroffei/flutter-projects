import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';

class SuperDealItem extends StatelessWidget {
  final Product item;
  const SuperDealItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await Navigator.pushNamed(
        context,
        '/products/detail',
        arguments: item,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: item.thumbnail,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                    placeholder: (_, __) => const CustomShimmer(
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    "-${item.discountPercentage}%",
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ).padY(1).padX(3),
                ).padL(1).padT(1),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              text: "GHS ",
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: item.price.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ).padL(5),
          Row(
            children: [
              Text(
                "${item.stock.toString()} left",
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.star,
                size: 11,
                color: Colors.black54,
              ).padX(3),
              Text(
                item.rating.toString(),
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ).padL(5)
        ],
      ).padR(10),
    );
  }
}

class SuperDeals extends StatelessWidget {
  final List<Product> items;

  SuperDeals({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
              text: "Super",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 18,
                fontStyle: FontStyle.italic,
                height: 1.2,
              ),
              children: [
                TextSpan(
                  text: "Deals",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "\nLimited-time Offers",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ]),
        ).padB(10),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items
                .map(
                  (e) => SuperDealItem(item: e),
                )
                .toList(),
          ),
        )
      ],
    ).padB(10);
  }
}
