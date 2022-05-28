import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/components/product_card.dart';
import 'package:zoomart/presentation/screens/like_screen/like_view_model.dart';

import '../../models/goods_model.dart';
import '../../services/api_manager.dart';

class LikePresenter extends BasePresenter<LikeViewModel> {
  LikePresenter(LikeViewModel model) : super(model);

  Future<List<Goods>> products = fetchGoods();
}

// ProductCard getProductCard(List<int> idsInCart, List<Goods> goods) {
//   for(var i = 0; i < idsInCart.length; i++) {
//     return ProductCard(
//       image: goods[idsInCart[i]].photo!,
//       title: goods[idsInCart[i]].name!,
//       price: goods[idsInCart[i]].price!,
//       description: goods[idsInCart[i]].description!,
//       showDesc: false,
//       quantity: 1,
//     );
//   }
// }