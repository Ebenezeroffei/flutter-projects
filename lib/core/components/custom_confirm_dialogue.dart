import 'package:flutter/material.dart';

class CustomConfirmDialogue extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onYesResponse;
  final VoidCallback onNoResponse;

  const CustomConfirmDialogue({
    super.key,
    required this.title,
    required this.message,
    required this.onYesResponse,
    required this.onNoResponse,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: Text(title),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      actionsPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onYesResponse();
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            onNoResponse();
          },
          child: const Text("No"),
        ),
      ],
    );
  }
}
