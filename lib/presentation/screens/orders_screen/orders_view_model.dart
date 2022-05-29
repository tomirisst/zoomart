import 'dart:ffi';

import 'package:zoomart/presentation/base/base_screen_state.dart';
import 'package:zoomart/presentation/base/base_view_model.dart';

class OrderViewModel extends BaseViewModel{
  OrderViewModel(ScreenState state) : super(state);
}
class Order {
  final int orderNumber;
  final int total;
  final String status;

  Order({
    required this.orderNumber,
    required this.total,
    required this.status,
  });
}