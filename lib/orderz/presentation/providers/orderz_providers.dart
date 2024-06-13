import 'package:hooks_riverpod/hooks_riverpod.dart';

enum OrderFilters { all, fulfilled, pending }

final providerOfSelectedOrderFilter = StateProvider<OrderFilters>(
  (ref) => OrderFilters.all,
);
