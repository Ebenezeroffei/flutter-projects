import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/orderz/domain/entities/order.dart';
import 'package:flutter_projects/orderz/presentation/pages/home/widgets/order_filter.dart';
import 'package:flutter_projects/orderz/presentation/pages/home/widgets/order_item.dart';
import 'package:flutter_projects/orderz/presentation/providers/orderz_providers.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Orderz extends ConsumerWidget {
  Orderz({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final orders = Hive.box<OrderEntity>('ordersBox');
    final selectedOrderFilter = ref.watch(providerOfSelectedOrderFilter);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orderz"),
      ),
      backgroundColor: Colors.grey.shade50,
      body: ValueListenableBuilder(
        valueListenable: orders.listenable(),
        builder: (context, box, _) {
          List<OrderEntity> data = box.values.toList();

          switch (selectedOrderFilter) {
            case OrderFilters.fulfilled:
              data.retainWhere((element) => element.isFulfilled);
              break;
            case OrderFilters.pending:
              data.retainWhere((element) => !element.isFulfilled);
              break;
            default:
              break;
          }
          if (data.isEmpty) {
            final String noOrderText;
            switch (selectedOrderFilter) {
              case OrderFilters.fulfilled:
                noOrderText = "No Orders Fulfilled";
                break;
              case OrderFilters.pending:
                noOrderText = "No Orders Pending";
                break;
              default:
                noOrderText = "No Orders Have Been Added..";
                break;
            }

            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrderFilter(),
                Expanded(
                  child: Center(
                    child: Text(
                      noOrderText,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ).pad(10);
          }

          // Calculate total
          double total = data.fold<double>(
            0,
            (currentValue, order) => currentValue += order.total,
          );
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: OrderFilter(),
              ),
              SliverToBoxAdapter(
                child: Text(
                  "Total: ${total.toStringAsFixed(2)}",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ).padB(5),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final OrderEntity order = data[index];
                  total += order.total;
                  return OrderItem(order: order);
                }, childCount: data.length),
              )
            ],
          ).pad(10);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async => await Navigator.pushNamed(
          context,
          '/orderz/form',
        ),
        label: Text("Add Order".toUpperCase()),
        icon: const Icon(Icons.add),
        elevation: 1,
      ),
    );
  }
}
