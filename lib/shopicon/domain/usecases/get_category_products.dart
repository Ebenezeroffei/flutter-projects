import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/domain/repositories/category_repository.dart';

class GetCategoryProducts {
  final CategoryRepository _repository;

  GetCategoryProducts(this._repository);

  Future<Either<Failure, List<Product>>> execute(String category) async {
    return await _repository.getCategoryProducts(category);
  }
}
