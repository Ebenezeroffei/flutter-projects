import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/dog-breeds/providers/dog_breed_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DogBreedsDetailSubBreedsList extends ConsumerWidget {
  final List subBreeds;
  final String selectedSubBreed;
  final String breed;

  const DogBreedsDetailSubBreedsList({
    super.key,
    required this.subBreeds,
    required this.selectedSubBreed,
    required this.breed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: subBreeds
              .map(
                (e) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: e.toString().title() == selectedSubBreed
                        ? Colors.blue
                        : Colors.grey.shade300,
                  ),
                  child: GestureDetector(
                    onTap: () => ref
                        .read(providerOfSelectedSubBreed(breed).notifier)
                        .state = e.toString().title(),
                    child: Text(
                      e.toString().title(),
                      style: TextStyle(
                        color: e.toString().title() == selectedSubBreed
                            ? Colors.white
                            : Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ).padR(5),
              )
              .toList(),
        ),
      ),
    );
  }
}
