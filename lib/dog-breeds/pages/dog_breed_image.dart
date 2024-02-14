import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';

class DogBreedImage extends StatelessWidget {
  final String imageUrl;
  final String breed;

  const DogBreedImage({
    super.key,
    required this.imageUrl,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.toString().title()),
      ),
      body: InteractiveViewer(
        maxScale: 2,
        minScale: 1,
        child: Center(
          child: Hero(
            tag: imageUrl,
            transitionOnUserGestures: true,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (_, __) => Image.asset(
                'assets/images/dog-preloader.gif',
                width: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
