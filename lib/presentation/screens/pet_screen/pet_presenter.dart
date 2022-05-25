import 'package:url_launcher/url_launcher.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/pet_screen/pet_view_model.dart';

import '../../models/pets_model.dart';
import '../../services/api_manager.dart';

class PetPresenter extends BasePresenter<PetViewModel>{
  PetPresenter(PetViewModel model) : super(model);

}
Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}