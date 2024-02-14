import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';
import 'package:flutter_projects/core/extensions/string_extension.dart';

class DogBreedListItem extends StatelessWidget {
  final String dogBreedName;

  const DogBreedListItem({
    super.key,
    required this.dogBreedName,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: ListTile(
          onTap: () async => await Navigator.pushNamed(
            context,
            '/dog-breeds/detail',
            arguments: dogBreedName,
          ),
          tileColor: Colors.white,
          title: Text(
            dogBreedName.title(),
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: 25,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    ).padB(10);
  }
}
