import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_refresh.dart';
import 'package:flutter_projects/dog-breeds/components/dog_breed_list_item.dart';
import 'package:flutter_projects/dog-breeds/components/dog_breeds_shimmer.dart';
import 'package:flutter_projects/dog-breeds/providers/dog_breed_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DogBreedsPage extends ConsumerWidget {
  const DogBreedsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dogBreeds = ref.watch(providerOfDogBreedList);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog Breeds"),
        backgroundColor: Colors.grey.shade200,
      ),
      backgroundColor: Colors.grey.shade200,
      body: dogBreeds.isLoading
          ? const DogBreedsShimmer()
          : dogBreeds.when(
              data: (data) {
                final List dogBreeds = data.keys.toList();
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index) {
                    final String item = dogBreeds[index];
                    return DogBreedListItem(
                      dogBreedName: item,
                    );
                  },
                  itemCount: dogBreeds.length,
                );
              },
              error: (_, __) => CustomRefresh(
                  onClickHandler: () => ref.invalidate(providerOfDogBreedList)),
              loading: () => const DogBreedsShimmer(),
            ),
    );
  }
}
