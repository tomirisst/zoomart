import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/components/my_text_form_field.dart';
import 'package:zoomart/presentation/screens/payment_screen/payment_presenter.dart';
import 'package:zoomart/presentation/screens/payment_screen/payment_view_model.dart';

import '../../base/base_screen_state.dart';
import '../../components/custom_button.dart';
import '../navigation/navigation_screen.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen( {Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  Widget buildTextField({required double leftPadding, required double rightPadding, required String hintText}){
    return Container(
      margin: EdgeInsets.only(
        bottom: 20, top: 20, left: leftPadding, right: rightPadding,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.grey[100],
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),

          ),

        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Order number is 12456",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
              ),
              Divider(),
              Container(
                height: 180,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: SweepGradient(
                    center: AlignmentDirectional(1, -1),
                    startAngle: 1.7,
                    endAngle: 3,
                    colors: const <Color>[
                      Color(0xff148535),
                      Color(0xff148535),
                      Color(0xff0D6630),
                      Color(0xff0D6630),
                      Color(0xff148535),
                      Color(0xff148535),
                    ],
                    stops: const <double>[
                      0.0,
                      0.3,
                      0.3,
                      0.7,
                      0.7,
                      1.0
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "VISA",
                          style: TextStyle(
                            fontSize: 24.30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "visa Electron",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                    Text(
                        "****  ****  ****  ****  2193",
                      style: TextStyle(
                        fontSize: 24.30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Card holder",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      "John Doe",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),

                                  ],
                                )
                            ),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Expires",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      "07 / 22",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.white,
                                      ),
                                    ),

                                  ],
                                )
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.lightGreen,
                                  child: Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              MyTextFormField(
                  hintText: "Card holder",
                  obscureText: false
              ),
              MyTextFormField(
                  hintText: "Card number",
                  obscureText: false
              ),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                      hintText: "Exp",
                      leftPadding: 20,
                      rightPadding: 0,
                    )
                  ),
                  Expanded(
                      child: buildTextField(
                        hintText: "CVV",
                        leftPadding: 5,
                        rightPadding: 10,
                      )
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton.icon(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            primary: AppColors.primaryColor,
                            onSurface: Colors.grey,
                          ),
                          icon: Icon(
                              Icons.add,
                              color: AppColors.white,
                          ),
                          label: Text(
                              "Add",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                          ),
                    ),
                  )
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: Colors.white70,
                title: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order amount",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                trailing: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$108.98",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                ),
                ),
              child: CustomButton(
                onClicked: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => NavigationScreen()));
                },
                text: "Buy",
              ),
    )
            ],
          )
        ],
      ),
    );
  }
}
