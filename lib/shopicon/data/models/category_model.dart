import 'package:equatable/equatable.dart';
import 'package:flutter_projects/shopicon/domain/entities/category.dart';

class CategoryModel extends Equatable {
  final String name;

  const CategoryModel({required this.name});

  factory CategoryModel.fromJSON(String name) => CategoryModel(name: name);

  CategoryEntity toEntity() => CategoryEntity(name: name);

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
