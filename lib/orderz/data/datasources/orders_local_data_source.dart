import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';
import 'package:hive_flutter/adapters.dart';

abstract class OrderLocalDataSource {
  Future<OrderEntity> addOrder({
    required String name,
    required String contact,
    required Map<String, int> orderItems,
    required double total,
    required bool isFulfilled,
  });
}

class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  @override
  Future<OrderEntity> addOrder({
    required String name,
    required String contact,
    required Map<String, int> orderItems,
    required double total,
    required bool isFulfilled,
  }) async {
    try {
      await Hive.openBox<OrderEntity>('ordersBox');
      final Box<OrderEntity> orders = Hive.box<OrderEntity>('ordersBox');
      OrderEntity order = OrderEntity(
        contact: contact,
        isFulfilled: isFulfilled,
        name: name,
        orderItems: orderItems,
        total: total,
      );

      orders.put(order.id, order);
      return order;
    } catch (e) {
      throw DeviceException("An error occurred while adding orders");
    }
  }
}
