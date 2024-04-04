import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String thumbnail;
  final String brand;
  final String category;
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
