import 'package:flutter/material.dart';

class Orderz extends StatelessWidget {
  const Orderz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orderz"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async => await Navigator.pushNamed(
          context,
          '/orderz/form',
        ),
        label: Text("Add Order".toUpperCase()),
        icon: const Icon(Icons.add),
        elevation: 1,
      ),
    );
  }
}
