import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/core/utils/network_connection.dart';
import 'package:flutter_projects/shopicon/data/datasources/category_remote_datasource.dart';
import 'package:flutter_projects/shopicon/data/models/category_model.dart';
import 'package:flutter_projects/shopicon/data/models/product_model.dart';
import 'package:flutter_projects/shopicon/domain/entities/category.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final NetworkConnection _networkConnection = NetworkConnection();
  final CategoryRemoteDataSourceImpl _categoryRemoteDataSource =
      CategoryRemoteDataSourceImpl();

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      await _networkConnection.check();
      final List<CategoryModel> data =
          await _categoryRemoteDataSource.getCategories();
      final List<CategoryEntity> categories =
          data.map<CategoryEntity>((e) => e.toEntity()).toList();
      return Right(categories);
    } on SocketException catch (e) {
      return Left(Failure(e.message));
    } on DeviceException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getCategoryProducts(
      String category) async {
    try {
      await _networkConnection.check();
      final List<ProductModel> data =
          await _categoryRemoteDataSource.getCategoryProducts(category);
      final List<Product> products = data
          .map<Product>(
            (e) => e.toEntity(),
          )
          .toList();
      return Right(products);
    } on SocketException catch (e) {
      return Left(Failure(e.message));
    } on DeviceException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
