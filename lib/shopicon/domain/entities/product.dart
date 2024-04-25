import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'product.g.dart';

@HiveType(typeId: 2)
class Product extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int price;

  @HiveField(4)
  final double discountPercentage;

  @HiveField(5)
  final double rating;

  @HiveField(6)
  final int stock;

  @HiveField(7)
  final String thumbnail;

  @HiveField(8)
  final String brand;

  @HiveField(9)
  final String category;

  @HiveField(10)
  final List images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.brand,
    required this.category,
    required this.images,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title];
}
