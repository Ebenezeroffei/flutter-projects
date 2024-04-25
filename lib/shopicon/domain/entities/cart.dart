import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final Product product;

  @HiveField(2)
  final int quantity;

  Cart({required this.id, required this.product, required this.quantity});

  @override
  String toString() {
    return "<Cart: ${product.title} - $quantity>";
  }
}
