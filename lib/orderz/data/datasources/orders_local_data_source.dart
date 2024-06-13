import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';
import 'package:hive_flutter/adapters.dart';

abstract class OrderLocalDataSource {
  Future<OrderEntity> addOrder({
    required String name,
    required String contact,
    required double total,
    required bool isFulfilled,
    bool isEdit = false,
    String? itemId,
  });
}

class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  @override
  Future<OrderEntity> addOrder({
    required String name,
    required String contact,
    required double total,
    required bool isFulfilled,
    bool isEdit = false,
    String? itemId,
  }) async {
    try {
      final Box<OrderEntity> orders = Hive.box<OrderEntity>('ordersBox');
      if (isEdit) {
        print(itemId);
        OrderEntity? order = orders.get(itemId);
        if (order != null) {
          order = order.update(
            name: name,
            contact: contact,
            total: total,
            isFulfilled: isFulfilled,
          );
          await orders.put(order.id, order);
          return order;
        }
        return OrderEntity(
          name: name,
          contact: contact,
          isFulfilled: isFulfilled,
          total: total,
        );
      } else {
        OrderEntity order = OrderEntity(
          contact: contact,
          isFulfilled: isFulfilled,
          name: name,
          total: total,
        );
        await orders.put(order.id, order);
        return order;
      }
    } catch (e) {
      throw DeviceException("An error occurred while adding orders");
    }
  }
}
