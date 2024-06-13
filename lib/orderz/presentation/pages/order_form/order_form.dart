import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_button.dart';
import 'package:flutter_projects/core/components/custom_text_field.dart';
import 'package:flutter_projects/core/contants/validators.dart';
import 'package:flutter_projects/orderz/data/repositories/orders_repositories_impl.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class OrderForm extends ConsumerWidget {
  final bool isEdit;
  final OrderEntity? order;

  OrderForm({super.key, this.order, bool? isEdit}) : isEdit = isEdit ?? false;
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController total = TextEditingController();
  final TextEditingController items = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isFulfilled = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isEdit && order != null) {
      name.text = order!.name;
      phoneNumber.text = order!.contact;
      total.text = order!.total.toString();
      isFulfilled.value = order!.isFulfilled;
    }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Is Fulfilled?"),
                ValueListenableBuilder(
                  valueListenable: isFulfilled,
                  builder: (_, __, ___) => Switch.adaptive(
                      value: isFulfilled.value,
                      onChanged: (value) => isFulfilled.value = value),
                ),
              ],
            ),
            CustomButton.text(
              "Save",
              () async {
                if (formKey.currentState!.validate()) {
                  OrdersRepositoriesImpl repository = OrdersRepositoriesImpl();
                  final res = await repository.addOrder(
                    name: name.text,
                    contact: phoneNumber.text,
                    total: double.parse(total.text),
                    isFulfilled: isFulfilled.value,
                    isEdit: isEdit,
                    itemId: order?.id,
                  );
                  res.fold(
                    (l) => toastification.show(
                      context: context,
                      description: Text(l.message),
                      autoCloseDuration: const Duration(seconds: 2),
                      type: ToastificationType.error,
                    ),
                    (r) {
                      toastification.show(
                        context: context,
                        description: Text(isEdit
                            ? "Order Updated Successfully"
                            : "Order Added Successfully"),
                        autoCloseDuration: const Duration(seconds: 2),
                        type: ToastificationType.success,
                      );
                      Navigator.pushReplacementNamed(context, '/orderz');
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
