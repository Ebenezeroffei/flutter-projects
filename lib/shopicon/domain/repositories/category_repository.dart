import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/shopicon/domain/entities/category.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();

  Future<Either<Failure, List<Product>>> getCategoryProducts(String category);
}
