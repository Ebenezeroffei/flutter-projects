import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/padding_extenstion.dart';

class CustomRefresh extends StatelessWidget {
  final VoidCallback onClickHandler;

  const CustomRefresh({super.key, required this.onClickHandler});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "0ops!",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.red.shade300,
            ),
          ),
          const Text(
            "Something went wrong",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
          ),
          const Text(
            "Please check your internet connection and try again.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          OutlinedButton(
            onPressed: onClickHandler,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: const Text("Refresh"),
          ).padT(10)
        ],
      ).padY(50).padX(10),
    );
  }
}
