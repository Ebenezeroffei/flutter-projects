import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/failure.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';
import 'package:flutter_projects/orderz/domain/repositories/order_repositories.dart';

class AddOrder {
  final OrderRepositories _repository;

  AddOrder(this._repository);

  Future<Either<Failure, OrderEntity>> execute({
    required String name,
    required String contact,
    required double total,
    required bool isFulfilled,
  }) =>
      _repository.addOrder(
        name: name,
        contact: contact,
        total: total,
        isFulfilled: isFulfilled,
      );
}
