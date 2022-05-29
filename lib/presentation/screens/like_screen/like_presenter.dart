import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/like_screen/like_view_model.dart';

import '../../services/api_manager.dart';
import '../bone_screen/bone_view_model.dart';

class LikePresenter extends BasePresenter<LikeViewModel> {
  LikePresenter(LikeViewModel model) : super(model);

  Future<List<Goods>> products = fetchGoods();
}