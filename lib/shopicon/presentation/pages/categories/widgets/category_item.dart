import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/string_extension.dart';
import 'package:flutter_projects/shopicon/domain/entities/category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryItem extends ConsumerWidget {
  final CategoryEntity category;

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 3,
      shadowColor: Colors.black12,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: ListTile(
        title: Text(category.name.title()),
        trailing: const Icon(Icons.chevron_right),
        onTap: () async => await Navigator.pushNamed(context, '/categories',
            arguments: category.name.title()),
      ),
    );
  }
}
