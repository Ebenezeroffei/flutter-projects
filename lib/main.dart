import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_projects/core/utils/misc_utils.dart';
import 'package:flutter_projects/custom_routes.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  await dotenv.load();
  await MiscUtils.initHive();
  await Hive.openBox<OrderEntity>('ordersBox');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Projects',
      debugShowCheckedModeBanner:
          dotenv.get('DEBUG', fallback: 'true') == '6true',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: CustomRoutes.generateRoute,
    );
  }
}
