import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';

abstract class OrderRepositories {
  Future<Either<Failure, OrderEntity>> addOrder(
      {required String name,
      required String contact,
      required double total,
      required bool isFulfilled,
      bool isEdit = false,
      String? itemId});
}
