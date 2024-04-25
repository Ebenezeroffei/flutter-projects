import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailSlider extends StatelessWidget {
  final List productImages;
  const ProductDetailSlider(this.productImages, {super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: productImages.length,
      itemBuilder: (context, itemIndex, pageViewIndex) => CachedNetworkImage(
        imageUrl: productImages[itemIndex],
        width: 500,
        height: 300,
        fit: BoxFit.cover,
        placeholder: (context, _) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1,
        autoPlay: true,
        enableInfiniteScroll: true,
      ),
    );
  }
}
