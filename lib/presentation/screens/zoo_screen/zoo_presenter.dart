import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/zoo_screen/zoo_view_model.dart';

import '../../services/api_manager.dart';

class ZooPresenter extends BasePresenter<ZooViewModel> {
  ZooPresenter(ZooViewModel model) : super(model);

  List<String> categories = [
    "All",
    "Dog",
    "Cat",
    "Bird",
    "Lizard",
  ];
  Future<List<Pets>> pets = fetchPets();
  List<Pets> changeCategory(String cat, List<Pets> pet) {
    List<Pets> catPets = [];
    if (cat != "All") {
      pet.forEach((element) {
        if (element.group == cat) {
          catPets.add(element);
        }
      });
      return catPets;
    }
    return pet;
  }
}
