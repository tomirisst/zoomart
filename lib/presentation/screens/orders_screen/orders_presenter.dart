import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/orders_screen/orders_view_model.dart';

class OrderPresenter extends BasePresenter<OrderViewModel>{
  OrderPresenter(OrderViewModel model) : super(model);
  List<Order> orders = [
    Order(
        orderNumber: 12345,
        total: 1900,
        status: "Delivery in 2 days"
    ),
    Order(
        orderNumber: 11235,
        total: 2560,
        status: "Completed"
    ),
    Order(
        orderNumber: 11248,
        total: 65236,
        status: "Completed"
    ),
    Order(
        orderNumber: 89665,
        total: 5620,
        status: "Completed"
    ),
  ];
}