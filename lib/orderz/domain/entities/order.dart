import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'order.g.dart';

@HiveType(typeId: 3)
class OrderEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String contact;
  @HiveField(3)
  final double total;
  @HiveField(4)
  final bool isFulfilled;

  OrderEntity({
    required this.name,
    required this.contact,
    required this.isFulfilled,
    required this.total,
    id,
  }) : id = id ?? const Uuid().v4();

  OrderEntity update(
      {required String name,
      required String contact,
      required double total,
      required bool isFulfilled}) {
    return OrderEntity(
      id: id,
      name: name,
      contact: contact,
      isFulfilled: isFulfilled,
      total: total,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, contact, total, isFulfilled];
}
