import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomButton({super.key, required this.onPressed, required this.child});

  factory CustomButton.text(String text, VoidCallback onPressed) {
    final Widget child = Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
    return CustomButton(onPressed: onPressed, child: child);
  }

  factory CustomButton.loading() {
    const Widget child = SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.blue,
      ),
    );
    return CustomButton(
      onPressed: () {},
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      child: child,
    ).padY(10);
  }
}
