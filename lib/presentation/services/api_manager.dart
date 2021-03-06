import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import '../screens/bone_screen/bone_view_model.dart';
import '../screens/zoo_screen/zoo_view_model.dart';

Future<List<Goods>> fetchGoods() async {
  final response = await http.get(Uri.parse(Strings.apiUrl));
  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    List<Goods> listOfGoods = [];

    for (var item in result["goodsArray"]) {
      listOfGoods.add(Goods.fromJson(item));
    }
    // print('${listOfGoods.first.name}');
    return listOfGoods;
  } else {
    throw Exception('Failed to load goods list');
  }
}

Future<List<Pets>> fetchPets() async {
  final response = await http.get(Uri.parse(Strings.petsUrl));
  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    List<Pets> listOfPets = [];

    for (var item in result["petsArray"]) {
      listOfPets.add(Pets.fromJson(item));
    }
    // print('${listOfPets.first.description}');
    return listOfPets;
  } else {
    throw Exception('Failed to load pets list');
  }
}
