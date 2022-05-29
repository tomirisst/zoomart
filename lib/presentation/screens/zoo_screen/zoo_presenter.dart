import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/zoo_screen/zoo_view_model.dart';

import '../../services/api_manager.dart';

class ZooPresenter extends BasePresenter<ZooViewModel> {
  ZooPresenter(ZooViewModel model) : super(model);

  List<String> categories = [
    "All",
    "Dogs",
    "Birds",
    "Lizards",
    "Mices",
    "Other",
  ];
  Future<List<Pets>> pets = fetchPets();
}
