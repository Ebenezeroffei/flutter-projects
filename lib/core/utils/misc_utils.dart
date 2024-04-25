import 'package:flutter/material.dart';
import 'package:flutter_projects/shopicon/domain/entities/cart.dart';
import 'package:flutter_projects/shopicon/domain/entities/product.dart';
import 'package:hive_flutter/adapters.dart';

class MiscUtils {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CartAdapter());
    Hive.registerAdapter(ProductAdapter());
  }

  static showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
