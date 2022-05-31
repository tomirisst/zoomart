import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/bone_screen/bone_view_model.dart';
import 'package:zoomart/presentation/services/api_manager.dart';

import '../../models/goods_model.dart';
import '../../models/pets_model.dart';
import '../like_screen/like_presenter.dart';

class BonePresenter extends BasePresenter<BoneViewModel> {
  BonePresenter(BoneViewModel model) : super(model);

  List<String> categories = [
    "All",
    "Toys",
    "Tools",
    "Food",
    "Feeding Tools",
    "Other",
  ];
  Future<List<Goods>> products = fetchGoods();
  List<Goods> changeCategory(int catID, List<Goods> goods) {
    List<Goods> catGoods = [];
    if (catID != 0) {
      for (var element in goods) {
        if (element.categoryID == catID) {
          catGoods.add(element);
        }
      }
      return catGoods;
    }
    return goods;
  }
}
