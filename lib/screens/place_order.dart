import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:luxury_fashion_app/widgets/custom_text.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_shipping_method.dart';
import 'add_address.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.quantity,
    required this.total,
  });
  final String image;
  final String name;
  final double price;
  final String description;
  final int quantity;
  final double total;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;

  void _openAddress(context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAdress()),
    );
    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  void _editAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAdress(editData: _savedAddress)),
    );

    setState(() {
      _savedAddress = newAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Center(
              child: CustomText(
                text: 'Checkout'.toUpperCase(),
                spacing: 5,
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(5),
            Center(
              child: Image.asset(
                'assets/svgs/line.png',
                width: 190,
                color: Color(0xff555555),
              ),
            ),
            CustomText(
              text: 'Shipping adress'.toUpperCase(),
              fontSize: 18,
              color: Color(0xff888888),
              fontWeight: FontWeight.w600,
            ),

            Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _savedAddress != null
                    ? GestureDetector(
                        onTap: () {
                          _editAddress();
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text:
                                        "${_savedAddress['firstName'] + " " + _savedAddress['lastName']}"
                                            .toUpperCase(),
                                    fontSize: 20,
                                    color: Color(0xff1A1A1A),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  CustomText(
                                    text:
                                        "${_savedAddress['address'] + " " + _savedAddress['city']}"
                                            .toUpperCase(),
                                    fontSize: 15,
                                    color: Color(0xff555555),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Gap(6),
                                  CustomText(
                                    text:
                                        "${_savedAddress['state'] + " " + _savedAddress['zipCode']}"
                                            .toUpperCase(),
                                    fontSize: 15,
                                    color: Color(0xff555555),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Gap(6),
                                  CustomText(
                                    text: "${_savedAddress['phone']}"
                                        .toUpperCase(),
                                    fontSize: 15,
                                    color: Color(0xff555555),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Gap(6),
                                ],
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              'assets/svgs/arrow.svg',
                              width: 25,
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
                _savedAddress == null
                    ? GestureDetector(
                        onTap: () {
                          _openAddress(context);
                        },
                        child: customContainer(
                          'Add shipping adress',
                          false,
                          'assets/svgs/plus.svg',
                        ),
                      )
                    : SizedBox.shrink(),
                Gap(30),

                // shipping method
                CustomShippingMethod(),
                Gap(30),

                //payment method
                CustomText(
                  text: 'Payment method'.toUpperCase(),
                  fontSize: 18,
                  color: Color(0xff888888),
                  fontWeight: FontWeight.w600,
                ),
                Gap(10),
                customContainer('select payment method', false, 'assets/svgs/downarrow.svg',
                ),
              ],
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Total'.toUpperCase(),
                    spacing: 5,
                    fontSize: 18,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: '\$ ${widget.total}',
                    fontSize: 22,
                    color: Colors.red.shade200,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Gap(20),
            CustomButton(text: "Place Order", image: true, onTap: () {}),
            Gap(20),
          ],
        ),
      ),
    );
  }
}

Widget customContainer(text, isFreee, icon) {
  bool isFree = isFreee;
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
    decoration: BoxDecoration(
      color: Color(0xffF9F9F9),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        CustomText(
          text: text,
          fontSize: 18,
          color: Color(0xff555555),
          fontWeight: FontWeight.w600,
        ),
        Spacer(),
        isFree
            ? CustomText(
                text: 'Free',
                fontSize: 18,
                color: Color(0xff555555),
                fontWeight: FontWeight.w600,
              )
            : SizedBox.shrink(),
        Gap(20),
        SvgPicture.asset(icon),
      ],
    ),
  );
}
