import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/like_screen/like_view_model.dart';

class LikePresenter extends BasePresenter<LikeViewModel> {
  LikePresenter(LikeViewModel model) : super(model);

  List<TestLikedProduct> products = [
    TestLikedProduct(
      title: "Bone",
      price: "500",
      description: "Taking care of a pet is my favorite, it helps me to...",
      image: "https://s3-alpha-sig.figma.com/img/8b5f/5a4d/b52ae16db6eca4007744af75b60365ae?Expires=1651449600&Signature=ZTJu8vDfaaoX2eESMjC4pODWkRwYoE7Z2tqvLvBbalFZc9RKIBasZ7IlVdWKvW5Ptqlxmp2J5GhcFiRP~7qJca6rC1~plbFWCh3H7g3xUOqsRMISiskmA6CEYfcwhsuV47ryTfHOJs~1BptzsRcQEJYGYXarZGg6MWLPB0MlIEK06sVVBmEfvd31YqswewmAGFWGrHcBb7yn5w2gLBGHwaPNNWbQG5biekpUKnlF3yuz5j5-NAWpveBveUPYEAhYHTpnNHs8pdSXC1dm8-vtreuy--ERN83-rdbDibqLAyyYkJnqXm2Q7u7fessEmGZjaykR6jbi0I-HeuYuXR7-3A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    ),
    TestLikedProduct(
      title: "Bone",
      price: "500",
      description: "Taking care of a pet is my favorite, it helps me to...",
      image: "https://s3-alpha-sig.figma.com/img/8b5f/5a4d/b52ae16db6eca4007744af75b60365ae?Expires=1651449600&Signature=ZTJu8vDfaaoX2eESMjC4pODWkRwYoE7Z2tqvLvBbalFZc9RKIBasZ7IlVdWKvW5Ptqlxmp2J5GhcFiRP~7qJca6rC1~plbFWCh3H7g3xUOqsRMISiskmA6CEYfcwhsuV47ryTfHOJs~1BptzsRcQEJYGYXarZGg6MWLPB0MlIEK06sVVBmEfvd31YqswewmAGFWGrHcBb7yn5w2gLBGHwaPNNWbQG5biekpUKnlF3yuz5j5-NAWpveBveUPYEAhYHTpnNHs8pdSXC1dm8-vtreuy--ERN83-rdbDibqLAyyYkJnqXm2Q7u7fessEmGZjaykR6jbi0I-HeuYuXR7-3A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    ),
    TestLikedProduct(
      title: "Bone",
      price: "500",
      description: "Taking care of a pet is my favorite, it helps me to...",
      image: "https://s3-alpha-sig.figma.com/img/8b5f/5a4d/b52ae16db6eca4007744af75b60365ae?Expires=1651449600&Signature=ZTJu8vDfaaoX2eESMjC4pODWkRwYoE7Z2tqvLvBbalFZc9RKIBasZ7IlVdWKvW5Ptqlxmp2J5GhcFiRP~7qJca6rC1~plbFWCh3H7g3xUOqsRMISiskmA6CEYfcwhsuV47ryTfHOJs~1BptzsRcQEJYGYXarZGg6MWLPB0MlIEK06sVVBmEfvd31YqswewmAGFWGrHcBb7yn5w2gLBGHwaPNNWbQG5biekpUKnlF3yuz5j5-NAWpveBveUPYEAhYHTpnNHs8pdSXC1dm8-vtreuy--ERN83-rdbDibqLAyyYkJnqXm2Q7u7fessEmGZjaykR6jbi0I-HeuYuXR7-3A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    ),
    TestLikedProduct(
      title: "Bone",
      price: "500",
      description: "Taking care of a pet is my favorite, it helps me to...",
      image: "https://s3-alpha-sig.figma.com/img/8b5f/5a4d/b52ae16db6eca4007744af75b60365ae?Expires=1651449600&Signature=ZTJu8vDfaaoX2eESMjC4pODWkRwYoE7Z2tqvLvBbalFZc9RKIBasZ7IlVdWKvW5Ptqlxmp2J5GhcFiRP~7qJca6rC1~plbFWCh3H7g3xUOqsRMISiskmA6CEYfcwhsuV47ryTfHOJs~1BptzsRcQEJYGYXarZGg6MWLPB0MlIEK06sVVBmEfvd31YqswewmAGFWGrHcBb7yn5w2gLBGHwaPNNWbQG5biekpUKnlF3yuz5j5-NAWpveBveUPYEAhYHTpnNHs8pdSXC1dm8-vtreuy--ERN83-rdbDibqLAyyYkJnqXm2Q7u7fessEmGZjaykR6jbi0I-HeuYuXR7-3A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    ),
    TestLikedProduct(
      title: "Bone",
      price: "500",
      description: "Taking care of a pet is my favorite, it helps me to...",
      image: "https://s3-alpha-sig.figma.com/img/8b5f/5a4d/b52ae16db6eca4007744af75b60365ae?Expires=1651449600&Signature=ZTJu8vDfaaoX2eESMjC4pODWkRwYoE7Z2tqvLvBbalFZc9RKIBasZ7IlVdWKvW5Ptqlxmp2J5GhcFiRP~7qJca6rC1~plbFWCh3H7g3xUOqsRMISiskmA6CEYfcwhsuV47ryTfHOJs~1BptzsRcQEJYGYXarZGg6MWLPB0MlIEK06sVVBmEfvd31YqswewmAGFWGrHcBb7yn5w2gLBGHwaPNNWbQG5biekpUKnlF3yuz5j5-NAWpveBveUPYEAhYHTpnNHs8pdSXC1dm8-vtreuy--ERN83-rdbDibqLAyyYkJnqXm2Q7u7fessEmGZjaykR6jbi0I-HeuYuXR7-3A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    ),
  ];
}

class TestLikedProduct {
  final String title;
  final String price;
  final String image;
  final String description;

  TestLikedProduct({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
  });
}
