import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/orderz/data/datasources/orders_local_data_source.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';
import 'package:flutter_projects/orderz/domain/repositories/order_repositories.dart';

class OrdersRepositoriesImpl implements OrderRepositories {
  final OrderLocalDataSourceImpl localDataSource = OrderLocalDataSourceImpl();

  @override
  Future<Either<Failure, OrderEntity>> addOrder({
    required String name,
    required String contact,
    required double total,
    required bool isFulfilled,
    bool isEdit = false,
    String? itemId,
  }) async {
    try {
      final OrderEntity order = await localDataSource.addOrder(
        name: name,
        contact: contact,
        total: total,
        isFulfilled: isFulfilled,
        isEdit: isEdit,
        itemId: itemId,
      );
      return Right(order);
    } on DeviceException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
