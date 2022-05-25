import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/product_screen/product_view_model.dart';

import '../../models/goods_model.dart';

class ProductPresenter extends BasePresenter<ProductViewModel>{
  ProductPresenter(ProductViewModel model) : super(model);


}