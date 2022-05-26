import 'package:flutter/cupertino.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/payment_screen/payment_view_model.dart';


class PaymentPresenter extends BasePresenter<PaymentViewModel>{
  PaymentPresenter(PaymentViewModel model) : super(model);

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

}