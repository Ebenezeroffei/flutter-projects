import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_button.dart';
import 'package:flutter_projects/core/components/custom_text_field.dart';

class ItemForm extends StatelessWidget {
  ItemForm({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return AlertDialog.adaptive(
      title: const Text("Add Item"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      content: Form(
        key: _formKey,
        child: SizedBox(
          height: orientation == Orientation.portrait ? 280 : null,
          child: ListView(
            children: <Widget>[
              CustomTextField(
                controller: name,
                label: "Name",
              ),
              CustomTextField.number(
                controller: amount,
                label: "Amount",
              ),
              CustomButton.text("Save", () {
                if (_formKey.currentState!.validate()) {}
              }),
            ],
          ),
        ),
      ),
    );
  }
}
