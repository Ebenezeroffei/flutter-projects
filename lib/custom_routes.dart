import 'package:flutter/material.dart';
import 'package:flutter_projects/core/main.dart';
import 'package:flutter_projects/dog-breeds/main.dart';
import 'package:flutter_projects/dog-breeds/pages/dog_breed_image.dart';
import 'package:flutter_projects/dog-breeds/pages/dog_breeds_detail.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:flutter_projects/shopicon/presentation/pages/categories/category_products.dart';
import 'package:flutter_projects/shopicon/presentation/pages/main.dart';
import 'package:flutter_projects/shopicon/presentation/pages/product/product_detail.dart';
import 'package:flutter_projects/temperature-converter/main.dart';

class CustomRoutes {
  static Route goTo(Widget page) {
    return MaterialPageRoute(
      builder: (_) => page,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Temperature Converter
      case '/':
        return goTo(const HomePage());
      case '/temperature-converter':
        return goTo(const TemperatureConverterPage());
      // Dog Breeds
      case '/dog-breeds':
        return goTo(const DogBreedsPage());
      case '/dog-breeds/detail':
        if (settings.arguments is String) {
          return goTo(
            DogBreedDetails(
              breed: settings.arguments.toString(),
            ),
          );
        }
        return goTo(errorPage());
      case '/dog-breeds/detail/image':
        if (settings.arguments is Map) {
          final Map arguments = settings.arguments as Map;
          return goTo(
            DogBreedImage(
              imageUrl: arguments['imageUrl'],
              breed: arguments['breed'],
            ),
          );
        }
        return goTo(errorPage());
      // Shopicon
      case '/shopicon':
        return goTo(Shopicon());
      case '/categories':
        if (settings.arguments is String) {
          final String category = settings.arguments.toString();
          return goTo(CategoryProducts(category: category));
        }
        return goTo(errorPage());
      case '/products/detail':
        if (settings.arguments is Product) {
          final Product product = settings.arguments as Product;
          return goTo(ProductDetail(product: product));
        }
        return goTo(errorPage());
      default:
        return goTo(errorPage());
    }
  }

  static Widget errorPage() {
    return const Center(child: Text("Error"));
  }
}
