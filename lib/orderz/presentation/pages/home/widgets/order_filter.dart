import 'package:flutter/material.dart';
import 'package:flutter_projects/core/extensions/extensions.dart';
import 'package:flutter_projects/orderz/presentation/providers/orderz_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderFilterItem extends ConsumerWidget {
  final String name;
  final OrderFilters filter;

  const OrderFilterItem({super.key, required this.name, required this.filter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedOrderFilter = ref.watch(providerOfSelectedOrderFilter);
    final bool isSelected = selectedOrderFilter == filter;

    return OutlinedButton(
      onPressed: () =>
          ref.read(providerOfSelectedOrderFilter.notifier).state = filter,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey.shade500,
        ),
      ),
      child: Text(
        name,
        style: theme.textTheme.bodySmall?.copyWith(
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    ).padR(8);
  }
}

class OrderFilter extends StatelessWidget {
  const OrderFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: const Row(
        children: [
          OrderFilterItem(
            name: "All",
            filter: OrderFilters.all,
          ),
          OrderFilterItem(
            name: "Fulfilled",
            filter: OrderFilters.fulfilled,
          ),
          OrderFilterItem(
            name: "Pending",
            filter: OrderFilters.pending,
          ),
        ],
      ).padB(5),
    );
  }
}
