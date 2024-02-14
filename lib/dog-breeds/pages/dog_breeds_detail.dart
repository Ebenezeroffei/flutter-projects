import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_refresh.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/core/extensions/string_extension.dart';
import 'package:flutter_projects/dog-breeds/components/dog_breed_images_shimmer.dart';
import 'package:flutter_projects/dog-breeds/components/dog_breeds_detail_sub_breeds_list.dart';
import 'package:flutter_projects/dog-breeds/components/dog_breeds_detail_sub_breeds_shimmer.dart';
import 'package:flutter_projects/dog-breeds/providers/dog_breed_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DogBreedDetails extends ConsumerWidget {
  final String breed;

  const DogBreedDetails({super.key, required this.breed});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogBreedImages = ref.watch(providerOfDogBreedsImages(breed));
    final subBreedsList = ref.watch(providerOfDogSubBreedsList(breed));
    final selectedSubBreed = ref.watch(providerOfSelectedSubBreed(breed));

    return Scaffold(
      appBar: AppBar(
        title: Text(breed.title()),
      ),
      body: subBreedsList.isLoading
          ? const DogBreedsDetailSubBreedsShimmer()
          : subBreedsList.when(
              data: (data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DogBreedsDetailSubBreedsList(
                      subBreeds: data,
                      selectedSubBreed: selectedSubBreed,
                      breed: breed,
                    ),
                    dogBreedImages.isLoading
                        ? const Expanded(
                            child: DogBreedImagesShimmer(),
                          )
                        : dogBreedImages.when(
                            data: (data) {
                              return Expanded(
                                child: CustomScrollView(
                                  slivers: [
                                    SliverGrid(
                                      delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                          final imageUrl = data[index];
                                          return GestureDetector(
                                            onTap: () async =>
                                                await Navigator.pushNamed(
                                              context,
                                              '/dog-breeds/detail/image',
                                              arguments: {
                                                'imageUrl': imageUrl,
                                                'breed': breed,
                                              },
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 0.5,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Hero(
                                                tag: imageUrl,
                                                transitionOnUserGestures: true,
                                                child: CachedNetworkImage(
                                                  imageUrl: imageUrl,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                  placeholder: (_, __) =>
                                                      Image.asset(
                                                    'assets/images/dog-preloader.gif',
                                                    width: 100,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        childCount: data.length,
                                      ),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            error: (_, __) => Expanded(
                              child: CustomRefresh(
                                onClickHandler: () => ref.invalidate(
                                  providerOfDogBreedsImages(breed),
                                ),
                              ),
                            ),
                            loading: () => const Expanded(
                              child: DogBreedImagesShimmer(),
                            ),
                          )
                  ],
                );
              },
              error: (_, __) => CustomRefresh(
                onClickHandler: () =>
                    ref.invalidate(providerOfDogSubBreedsList),
              ),
              loading: () => const DogBreedsDetailSubBreedsShimmer(),
            ),
    );
  }
}
