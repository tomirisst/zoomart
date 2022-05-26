import 'package:flutter/material.dart';
import 'package:zoomart/presentation/screens/navigation/loading_screen.dart';
import 'package:zoomart/presentation/screens/pet_screen/pet_screen.dart';
import 'package:zoomart/presentation/screens/zoo_screen/widgets/animal_card.dart';
import 'package:zoomart/presentation/screens/zoo_screen/zoo_presenter.dart';
import 'package:zoomart/presentation/screens/zoo_screen/zoo_view_model.dart';

import '../../../constants/app_colors.dart';
import '../../base/base_screen_state.dart';
import '../../models/pets_model.dart';

class ZooScreen extends StatefulWidget {
  const ZooScreen({Key? key}) : super(key: key);

  @override
  _ZooScreenState createState() => _ZooScreenState();
}

class _ZooScreenState extends State<ZooScreen> {
  final ZooPresenter _presenter = ZooPresenter(ZooViewModel(ScreenState.none));
  //api
  List<Pets> pets = [];
  bool isLoading = false;

  Future<void> getPets() async {
    setState(() => isLoading = true);
    pets = await _presenter.pets;
    await Future.delayed(const Duration(seconds: 1));
    setState(() => isLoading = false);
    return;
  }

  @override
  void initState() {
    setState(() {
      getPets();
    });
    super.initState();
  }
  //api

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => isLoading ? const LoadingScreen() :
     Scaffold(
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
                      child: Text(
                        _presenter.categories[index],
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
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
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  var pet = pets[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetScreen(
                            pet: pet,
                          ),
                        ),
                      );
                    },
                    child: AnimalCard(
                      image: pet.photos!,
                      title: pet.name!,
                      description: pet.description!,
                      location: pet.city!,
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
// }
