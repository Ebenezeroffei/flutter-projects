import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';

class App extends StatelessWidget {
  final String appName;
  final String path;

  const App({
    super.key,
    required this.appName,
    required this.path,
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
          onTap: () async => await Navigator.pushNamed(context, path),
          tileColor: Colors.white,
          title: Text(
            appName,
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
