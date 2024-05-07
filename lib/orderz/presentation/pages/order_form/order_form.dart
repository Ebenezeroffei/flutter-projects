import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_button.dart';
import 'package:flutter_projects/core/components/custom_text_field.dart';
import 'package:flutter_projects/core/contants/validators.dart';
import 'package:flutter_projects/orderz/presentation/pages/order_form/widgets/item_form.dart';

class OrderForm extends StatelessWidget {
  OrderForm({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController total = TextEditingController();
  final TextEditingController items = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          children: [
            CustomTextField(
              controller: name,
              label: "Name",
            ),
            CustomTextField.number(
              controller: phoneNumber,
              label: "Phone Number",
              validator: (value) =>
                  !Validators.phoneNumber.hasMatch(value.toString())
                      ? "Please enter a valid phone number"
                      : null,
            ),
            CustomTextField.number(
              controller: total,
              label: "Total",
              validator: (value) =>
                  !Validators.floatRegex.hasMatch(value.toString())
                      ? "Please enter a valid value"
                      : null,
            ),
            CustomButton.text(
              "Save",
              () {
                if (formKey.currentState!.validate()) {
                  print("Ok");
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            showDialog(context: context, builder: (_) => ItemForm()),
        label: Text(
          "Add Item".toUpperCase(),
        ),
      ),
    );
  }
}
