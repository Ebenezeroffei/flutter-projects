import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/core/utils/network_connection.dart';
import 'package:flutter_projects/shopicon/data/datasources/remote_datasource.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final NetworkConnection _networkConnection = NetworkConnection();
  final RemoteDataSource _remoteDataSource = RemoteDataSourceImpl();

  @override
  Future<Either<Failure, List<Product>>> getProducts(String? category) async {
    try {
      await _networkConnection.check();
      final data = await _remoteDataSource.getProducts(category);
      return Right(
        data
            .map(
              (e) => e.toEntity(),
            )
            .toList(),
      );
    } on SocketException catch (e) {
      return Left(Failure(e.message));
    } on DeviceException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
