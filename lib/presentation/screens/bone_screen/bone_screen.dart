import 'package:flutter/material.dart';
import 'package:zoomart/presentation/screens/bone_screen/bone_presenter.dart';
import 'package:zoomart/presentation/screens/bone_screen/bone_view_model.dart';
import 'package:zoomart/presentation/screens/product_screen/product_screen.dart';

import '../../../constants/app_colors.dart';
import '../../base/base_screen_state.dart';
import '../../components/product_card.dart';

class BoneScreen extends StatefulWidget {
  const BoneScreen({Key? key}) : super(key: key);

  @override
  _BoneScreenState createState() => _BoneScreenState();
}

class _BoneScreenState extends State<BoneScreen> {
  final BonePresenter _presenter = BonePresenter(BoneViewModel(ScreenState.none));
  //api
  List<Goods> goods = [];
  List<Goods> catGoods = [];

  Future<void> getGoods() async {
    goods = await _presenter.products;
    catGoods = goods;
    setState(() {});
    return;
  }

  @override
  void initState() {
    setState(() {
      getGoods();
    });
    super.initState();
  }

  void changeCategory(int catID) {
    setState(() {
      catGoods = _presenter.changeCategory(catID, goods);
    });
  }
  //api
  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.background,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: const Offset(7, 7),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network("https://m.media-amazon.com/images/I/41AKvnBNqoL.jpg"),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.background,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: const Offset(7, 7),
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                physics: const BouncingScrollPhysics(),
                itemCount: _presenter.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 25,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.background,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(3, 3))
                      ],
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          changeCategory(index);
                        },
                        child: Text(
                          _presenter.categories[index],
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.background),
                          elevation: MaterialStateProperty.all(0.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: catGoods.length,
                itemBuilder: (context, index) {
                  var good = catGoods[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            good: good,
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      image: good.photo!,
                      title: good.name!,
                      price: good.price!,
                      description: good.description!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
