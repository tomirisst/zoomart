import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/components/product_card.dart';
import 'package:zoomart/presentation/screens/like_screen/like_view_model.dart';

import '../../models/goods_model.dart';
import '../../services/api_manager.dart';

class LikePresenter extends BasePresenter<LikeViewModel> {
  LikePresenter(LikeViewModel model) : super(model);

  Future<List<Goods>> products = fetchGoods();
}