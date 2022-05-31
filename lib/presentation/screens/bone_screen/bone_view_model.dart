import 'package:zoomart/presentation/base/base_screen_state.dart';
import 'package:zoomart/presentation/base/base_view_model.dart';

class BoneViewModel extends BaseViewModel{
  BoneViewModel(ScreenState state) : super(state);

}
class Goods {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? photo;
  final int? categoryID;
  bool? isInCart;

  Goods({
    required this.categoryID,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photo,
    required this.isInCart,
  });

  factory Goods.fromJson(Map<String, dynamic> json) {
    return Goods(
        id: int.parse(json['id']),
        name: json['name'],
        description: json['description'],
        price: json['price'],
        //!.toDouble()
        photo: json['photo'],
        categoryID: int.parse(json['category_id']),
        isInCart: false
    );
  }
}