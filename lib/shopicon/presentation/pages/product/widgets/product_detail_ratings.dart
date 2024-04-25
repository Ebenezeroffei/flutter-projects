import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';

class ProductDetailRatings extends StatelessWidget {
  final double rating;
  const ProductDetailRatings(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> ratingsList = [];

    for (int i = 0; i < 5; i++) {
      i < rating.toInt()
          ? ratingsList.add(Icon(
              Icons.star,
              size: 15,
              color: Colors.yellow.shade600,
            ))
          : ratingsList.add(Icon(
              Icons.star_outline,
              size: 15,
              color: Colors.yellow.shade600,
            ));
    }

    return Row(
      children: [
        ...ratingsList,
        Text(
          rating.toString(),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ).padL(5),
      ],
    );
  }
}
