import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/components/custom_button.dart';

import '../../models/pets_model.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../zoo_screen/zoo_view_model.dart';

class PetScreen extends StatefulWidget {
  final Pets pet;

  const PetScreen({Key? key, required this.pet}) : super(key: key);

  @override
  _PetScreenState createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: AppColors.primaryColor,
              child: Column(
                children: [Container()],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.network(
                            widget.pet.photos!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pet.name!,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              widget.pet.city!,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.black.withOpacity(0.4),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
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
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              widget.pet.name!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
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
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.pet.description!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 64,
                          child: Flexible(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 1,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 64,
                                    width: 64,
                                    padding: EdgeInsets.zero,
                                    margin: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
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
                                      borderRadius: BorderRadius.circular(32),
                                      child: Image.network(widget.pet.photos!),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ElevatedButton(
                        //     onPressed: () async {
                        //       await FlutterPhoneDirectCaller.callNumber(widget.pet.ownerNumber!);
                        //     },
                        //     child: Text("Adopt now")
                        // ),
                        CustomButton(
                            onClicked: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                                    title: Text("Adopt this cutie by one phone call!",),
                                    content: Text("But first contact the owner and get additiional info"),
                                    actions: [
                                      CustomButton(
                                          onClicked: () async {
                                            await FlutterPhoneDirectCaller.callNumber(widget.pet.ownerNumber!);
                                          },
                                          text: "Call"),
                                      // TextButton(
                                      //     onPressed: () {
                                      //       Navigator.of(context).pop();
                                      //     },
                                      //     child: Text("Cancel"),
                                      // ),
                                    ],
                                  ));

                            },
                            text: "Adopt now"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
