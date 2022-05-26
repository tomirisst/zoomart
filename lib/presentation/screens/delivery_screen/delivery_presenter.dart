import 'package:flutter/cupertino.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'delivery_view_model.dart';

class DeliveryPresenter extends BasePresenter<DeliveryViewModel>{
  DeliveryPresenter(DeliveryViewModel model) : super(model);

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

}