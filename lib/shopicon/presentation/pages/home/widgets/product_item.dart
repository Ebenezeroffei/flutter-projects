import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_shimmer.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';

class ProductItem extends StatelessWidget {
  final Product item;

  const ProductItem({super.key, required this.item});

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
                    width: double.infinity,
                    height: 150,
                    placeholder: (_, __) => const CustomShimmer(
                      height: 150,
                      width: double.infinity,
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
          Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ).padL(5).padT(3),
          RichText(
            text: TextSpan(
              text: "GHS ${item.price} ",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: " ${item.stock} left",
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black38,
                    ))
              ],
            ),
          ).padL(5),
        ],
      ).padR(10),
    );
  }
}
