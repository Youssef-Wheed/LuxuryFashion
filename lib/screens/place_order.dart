import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:luxury_fashion_app/screens/add_card.dart';
import 'package:luxury_fashion_app/widgets/custom_card_order.dart';
import 'package:luxury_fashion_app/widgets/custom_text.dart';

import '../widgets/custom_address_info.dart';
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
  dynamic _savedCard;

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

  void _openCard() async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddCard()),
    );
    if (cardData != null) {
      setState(() {
        _savedCard = cardData;
      });
    }
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
            _savedCard != null && _savedAddress != null
                ? SizedBox.shrink()
                : CustomText(
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
                    ? CustomAddressInfo(
                        saveAdress: _savedAddress,
                        onTap: _editAddress,
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
                _savedCard != null && _savedAddress != null
                    ? SizedBox.shrink()
                    : CustomShippingMethod(),
                Gap(30),

                //payment method
                _savedCard != null && _savedAddress != null
                    ? SizedBox.shrink()
                    : CustomText(
                        text: 'Payment method'.toUpperCase(),
                        fontSize: 18,
                        color: Color(0xff888888),
                        fontWeight: FontWeight.w600,
                      ),

                Gap(20),
                _savedCard != null
                    ? Column(
                        children: [
                          Divider(color: Colors.grey.shade300),
                          Gap(20),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/Mastercard.svg',
                                width: 40,
                              ),
                              Gap(10),
                              CustomText(
                                text: "Master card ending",
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              Gap(10),
                              CustomText(
                                text:
                                    ".... ${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/svgs/arrow.svg',
                                width: 25,
                              ),
                            ],
                          ),
                          Gap(20),
                          Divider(color: Colors.grey.shade300),
                        ],
                      )
                    : GestureDetector(
                        onTap: _openCard,
                        child: customContainer(
                          'select payment method',
                          false,
                          'assets/svgs/downarrow.svg',
                        ),
                      ),
                Gap(20),
                CustomCardOrder(
                  image: widget.image,
                  name: widget.name,
                  price: widget.price,
                  description: widget.description,
                  onChanged: (qty){
                    setState(() {

                    });
                  },
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
