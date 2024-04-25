import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar danger(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      closeIconColor: Colors.white,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      showCloseIcon: true,
    );
  }

  static SnackBar info(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      closeIconColor: Colors.red,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
      showCloseIcon: true,
    );
  }

  static SnackBar warning(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
        ),
      ),
      closeIconColor: Colors.red,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.yellow.shade800,
      showCloseIcon: true,
    );
  }

  static SnackBar primary(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      closeIconColor: Colors.red,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black87,
      showCloseIcon: true,
    );
  }
}
