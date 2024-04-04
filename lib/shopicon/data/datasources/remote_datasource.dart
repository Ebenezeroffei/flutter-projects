import 'dart:convert';

import 'package:flutter_projects/core/error/exception.dart';
import 'package:flutter_projects/shopicon/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<ProductModel>> getProducts(String? category);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts(String? category) async {
    final url = category != null
        ? Uri.parse('https://dummyjson.com/products/$category')
        : Uri.parse('https://dummyjson.com/products');

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final data = await jsonDecode(res.body);
      final List<ProductModel> productsList = data['products']
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
      return productsList;
    }
    throw DeviceException("Couldn't fetch products");
  }
}
