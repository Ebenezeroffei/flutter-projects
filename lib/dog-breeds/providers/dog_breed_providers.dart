import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final providerOfDogBreedList = FutureProvider.autoDispose<Map>((ref) async {
  final Uri url = Uri.parse(r'https://dog.ceo/api/breeds/list/all');
  final res = await http.get(url);
  final data = await jsonDecode(res.body);
  ref.keepAlive();
  return data['message'];
});

final providerOfDogBreedsImages =
    FutureProvider.family.autoDispose((ref, breed) async {
  final String subBreed = ref.watch(providerOfSelectedSubBreed(breed));

  final Uri url = subBreed == 'All'
      ? Uri.parse("https://dog.ceo/api/breed/$breed/images")
      : Uri.parse(
          "https://dog.ceo/api/breed/$breed/${subBreed.toLowerCase()}/images");

  final res = await http.get(url);

  if (res.statusCode == 200) {
    ref.keepAlive();
    final Map data = jsonDecode(res.body);
    return data['message'];
  }
  return [];
});

final providerOfDogSubBreedsList =
    FutureProvider.family.autoDispose((ref, breed) async {
  final Uri url = Uri.parse("https://dog.ceo/api/breed/${breed}/list");

  final res = await http.get(url);

  final Map data = await jsonDecode(res.body);
  ref.keepAlive();
  return ['All', ...data['message'] as List];
});

final providerOfSelectedSubBreed =
    StateProvider.family.autoDispose((ref, breed) => "All");
