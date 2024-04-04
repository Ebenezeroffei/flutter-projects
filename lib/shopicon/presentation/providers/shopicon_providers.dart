import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/shopicon/data/repositories/product_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerOfCurrentTab = StateProvider<int>((ref) => 0);

final providerOfGetProducts = FutureProvider.autoDispose((ref) async {
  final ProductRepositoryImpl repository = ProductRepositoryImpl();
  final products = await repository.getProducts(null);
  ref.keepAlive();
  return products.fold((l) => throw DeviceException(l.message), (r) => r);
});
