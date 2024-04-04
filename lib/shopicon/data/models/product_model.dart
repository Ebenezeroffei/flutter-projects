import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_projects/core/extensions/string_extension.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';

class ProductModel extends Equatable {
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

  const ProductModel({
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

  factory ProductModel.fromJson(Map data) {
    return ProductModel(
      id: data['id'],
      title: data['title'].toString().title(),
      description: data['description'],
      price: data['price'],
      discountPercentage: data['discountPercentage'].toDouble(),
      rating: data['rating'].toDouble(),
      stock: data['stock'],
      thumbnail: data['thumbnail'],
      brand: data['brand'],
      category: data['category'],
      images: data['images'],
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      thumbnail: thumbnail,
      brand: brand,
      category: category,
      images: images,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
      ];
}
