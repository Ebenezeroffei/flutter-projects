import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/app.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apps"),
        backgroundColor: Colors.grey.shade200,
      ),
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList.list(
            children: const <App>[
              // App(
              //   appName: "Temperature Converter",
              //   path: '/temperature-converter',
              // ),
              App(
                appName: "Dog Breeds",
                path: '/dog-breeds',
              ),
            ],
          ),
        ],
      ).pad(10),
    );
  }
}
