import 'dart:convert';

import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/shopicon/data/models/category_model.dart';
import 'package:flutter_projects/shopicon/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getCategoryProducts(String category);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    final url = Uri.parse("https://dummyjson.com/products/categories");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List data = await jsonDecode(res.body);
      final List<CategoryModel> categories =
          data.map<CategoryModel>((e) => CategoryModel.fromJSON(e)).toList();
      return categories;
    }
    throw DeviceException("Unable to get categories.");
  }

  @override
  Future<List<ProductModel>> getCategoryProducts(String category) async {
    final Uri url =
        Uri.parse('https://dummyjson.com/products/category/$category?limit=0');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map data = await jsonDecode(res.body);
      final List products = data['products'];
      final List<ProductModel> productModelList = products
          .map<ProductModel>(
            (e) => ProductModel.fromJson(e),
          )
          .toList();
      return productModelList;
    }
    throw DeviceException("Failed to load category products.");
  }
}
