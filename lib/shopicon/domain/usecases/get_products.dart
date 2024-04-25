import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository _repository;

  GetProducts(this._repository);

  Future<Either<Failure, List<Product>>> execute(String? category) async {
    return await _repository.getProducts(category);
  }
}
