import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/shopicon/data/repositories/category_repository_impl.dart';
import 'package:flutter_projects/shopicon/data/repositories/product_repository_impl.dart';
import 'package:flutter_projects/shopicon/domain/entities/cart.dart';
import 'package:flutter_projects/shopicon/domain/entities/category.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerOfCurrentTab = StateProvider<int>((ref) => 0);

final providerOfGetProducts = FutureProvider.autoDispose((ref) async {
  final ProductRepositoryImpl repository = ProductRepositoryImpl();
  final products = await repository.getProducts(null);
  ref.keepAlive();
  return products.fold(
    (l) => throw DeviceException(l.message),
    (r) => r,
  );
});

final providerOfGetCategories =
    FutureProvider.autoDispose<List<CategoryEntity>>((ref) async {
  final CategoryRepositoryImpl repository = CategoryRepositoryImpl();
  final categories = await repository.getCategories();
  return categories.fold(
    (l) => throw DeviceException(l.message),
    (r) {
      ref.keepAlive();
      return r;
    },
  );
});

final providerOfCategoryProducts =
    FutureProvider.autoDispose.family((ref, String category) async {
  final CategoryRepositoryImpl repository = CategoryRepositoryImpl();

  final res = await repository.getCategoryProducts(category);

  return res.fold(
    (l) => throw DeviceException(l.message),
    (r) {
      ref.keepAlive();
      return r;
    },
  );
});

final providerOfCart = FutureProvider.autoDispose((ref) async {
  await Hive.openBox<Cart>('cartBox');
  final cart = Hive.box<Cart>('cartBox');
  ref.keepAlive();
  return cart;
});
