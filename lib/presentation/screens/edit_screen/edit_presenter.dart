import 'package:flutter/cupertino.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'edit_view_model.dart';

class EditPresenter extends BasePresenter<EditViewModel>{
  EditPresenter(EditViewModel model) : super(model);

  TextEditingController nameController = TextEditingController(text: "Tomiris");
  TextEditingController emailController = TextEditingController(text: "tomiris@gmail.com");
  TextEditingController passwordController = TextEditingController();

}