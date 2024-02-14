import 'package:flutter/material.dart';
import 'package:flutter_projects/core/main.dart';
import 'package:flutter_projects/dog-breeds/main.dart';
import 'package:flutter_projects/temperature-converter/main.dart';

class CustomRoutes {
  static Route goTo(Widget page) {
    return MaterialPageRoute(
      builder: (_) => page,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return goTo(const HomePage());
      case '/temperature-converter':
        return goTo(const TemperatureConverterPage());
      case '/dog-breeds':
        return goTo(const DogBreedsPage());
      default:
        return goTo(errorPage());
    }
  }

  static Widget errorPage() {
    return const Center(child: Text("Error"));
  }
}
