import 'package:flutter/material.dart';
import 'package:flutter_projects/core/components/custom_confirm_dialogue.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:toastification/toastification.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: order.isFulfilled ? Colors.green.shade50 : Colors.red.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        side: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
      elevation: 0,
      child: ListTile(
        title: Text(order.name),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "GHC ${order.total}",
              style: TextStyle(
                color: order.isFulfilled ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              order.isFulfilled ? "Fulfilled" : "Pending",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () async => await Navigator.pushNamed(
                  context, '/orderz/form',
                  arguments: {
                    'order': order,
                    'isEdit': true,
                  }),
              child: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => CustomConfirmDialogue(
                    message: "Are you sure you want to delete this order?",
                    title: "Delete Order",
                    onYesResponse: () async {
                      final Box<OrderEntity> orders =
                          Hive.box<OrderEntity>('ordersBox');
                      await orders.delete(order.id);
                      // ignore: use_build_context_synchronously
                      toastification.show(
                        context: context,
                        description:
                            const Text("Order has been deleted successfully"),
                        autoCloseDuration: const Duration(seconds: 2),
                        type: ToastificationType.success,
                      );
                    },
                    onNoResponse: () {},
                  ),
                );
              },
              child: const Icon(
                Icons.delete,
                size: 20,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    ).padB(5);
  }
}
