import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

@HiveType(typeId: 3)
class OrderEntity extends Equatable {
  @HiveField(0)
  final Uuid id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String contact;
  @HiveField(3)
  final Map<String, int> orderItems;
  @HiveField(4)
  final double total;
  @HiveField(5)
  final bool isFulfilled;

  OrderEntity(
      {required this.name,
      required this.contact,
      required this.orderItems,
      required this.isFulfilled,
      required this.total,
      id})
      : id = id ?? const Uuid().v4();

  @override
  // TODO: implement props
  List<Object?> get props => [name, contact, orderItems, total, isFulfilled];
}
