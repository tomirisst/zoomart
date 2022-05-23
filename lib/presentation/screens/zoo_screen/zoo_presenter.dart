import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/zoo_screen/zoo_view_model.dart';

class ZooPresenter extends BasePresenter<ZooViewModel> {
  ZooPresenter(ZooViewModel model) : super(model);

  List<String> categories = [
    "Cats",
    "Dogs",
    "Birds",
    "Lizards",
    "Mices",
    "Other",
  ];

  List<TestDog> dogs = [
    TestDog(
      name: "Greyhound",
      image: "assets/images/dog_1.png",
      description: "Taking care of a pet is my favorite, it helps me to...",
      location: "New York City",
    ),
    TestDog(
      name: "Dobermann",
      image: "assets/images/dog_2.png",
      description: "Taking care of a pet is my favorite, it helps me to...",
      location: "New York City",
    ),
    TestDog(
      name: "Pomeranian",
      image: "assets/images/dog_3.png",
      description: "Taking care of a pet is my favorite, it helps me to...",
      location: "New York City",
    ),
    TestDog(
      name: "Greyhound",
      image: "assets/images/dog_1.png",
      description: "Taking care of a pet is my favorite, it helps me to...",
      location: "New York City",
    ),
  ];
}

class TestDog {
  final String name;
  final String image;
  final String description;
  final String location;

  TestDog({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
  });
}
