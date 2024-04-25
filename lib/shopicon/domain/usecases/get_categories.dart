import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/shopicon/domain/entities/category.dart';
import 'package:flutter_projects/shopicon/domain/repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository _repository;

  GetCategories(this._repository);

  Future<Either<Failure, List<CategoryEntity>>> execute() async {
    return await _repository.getCategories();
  }
}
