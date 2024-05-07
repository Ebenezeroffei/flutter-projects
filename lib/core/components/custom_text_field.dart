import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/core/contants/validators.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isRequired;
  final bool isTextArea;
  final String? helpText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    bool? obscureText,
    this.inputFormatters,
    this.validator,
    this.keyboardType,
    this.helpText,
    bool? isRequired,
    bool? isTextArea,
  })  : obscureText = obscureText ?? false,
        isRequired = isRequired ?? true,
        isTextArea = isTextArea ?? false;

  factory CustomTextField.password({
    required TextEditingController controller,
    String label = 'Password',
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    bool? isRequired,
    String? helpText,
  }) {
    return CustomTextField(
      controller: controller,
      label: label,
      obscureText: true,
      validator: validator,
      inputFormatters: inputFormatters,
      isRequired: isRequired,
      helpText: helpText,
    );
  }

  factory CustomTextField.email({
    required TextEditingController controller,
    String label = 'Email',
    bool? isRequired,
    String? helpText,
  }) {
    String? validator(value) {
      if (value != null && !Validators.email.hasMatch(value)) {
        return "Please enter a valid email";
      }
      return null;
    }

    List<TextInputFormatter>? inputFormatters = [
      FilteringTextInputFormatter.allow(
        RegExp(r'[a-z0-9@\.]+'),
      ),
    ];

    return CustomTextField(
      controller: controller,
      label: label,
      validator: validator,
      inputFormatters: inputFormatters,
      isRequired: isRequired,
      helpText: helpText,
    );
  }

  factory CustomTextField.number({
    required TextEditingController controller,
    required String label,
    bool? isRequired,
    String? helpText,
    String? Function(String?)? validator,
  }) {
    List<TextInputFormatter>? inputFormatters = [
      FilteringTextInputFormatter.allow(
        RegExp(r'[\d\.]+'),
      ),
    ];

    return CustomTextField(
      controller: controller,
      label: label,
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.number,
      isRequired: isRequired,
      helpText: helpText,
      validator: validator,
    );
  }

  factory CustomTextField.textArea({
    required TextEditingController controller,
    required String label,
    String? helpText,
  }) {
    return CustomTextField(
      controller: controller,
      label: label,
      isTextArea: true,
      helpText: helpText,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isEmpty = ValueNotifier(controller.text.isEmpty);

    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      minLines: isTextArea ? 5 : 1,
      maxLines: isTextArea ? 5 : 1,
      style: const TextStyle(
        fontSize: 16,
      ),
      obscureText: obscureText,
      validator: isRequired
          ? validator ??
              (value) {
                if (value != null && value.isEmpty) {
                  return "Please provide a value for this field.";
                }
                return null;
              }
          : null,
      cursorWidth: 1,
      onChanged: (value) => isEmpty.value = value.isEmpty,
      decoration: InputDecoration(
        helperText: helpText,
        suffixIcon: isTextArea
            ? null
            : ValueListenableBuilder<bool>(
                valueListenable: isEmpty,
                builder: (_, value, ___) => !value
                    ? IconButton(
                        onPressed: () {
                          controller.clear();
                          isEmpty.value = true;
                        },
                        splashRadius: 1,
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.red,
                        ),
                      )
                    : const SizedBox(
                        width: 0,
                        height: 0,
                      ),
              ),
        contentPadding: const EdgeInsets.all(18),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        labelText: isRequired ? "$label *" : label,
        alignLabelWithHint: true,
      ),
    ).padY(10);
  }
}
