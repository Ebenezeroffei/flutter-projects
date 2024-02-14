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
