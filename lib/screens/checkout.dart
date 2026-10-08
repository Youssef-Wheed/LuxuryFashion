import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:luxury_fashion_app/screens/place_order.dart';
import 'package:luxury_fashion_app/widgets/custom_button.dart';
import 'package:luxury_fashion_app/widgets/custom_card_order.dart';
import 'package:luxury_fashion_app/widgets/custom_header.dart';
import 'package:luxury_fashion_app/widgets/custom_text.dart';

import '../widgets/custom_appbar.dart';

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
  final String image;
  final String name;
  final double price;
  final String description;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int slectedQty = 1;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Gap(20),
            CustomHeader(name: 'Checkout'),
            CustomCardOrder(
              image: widget.image,
              name: widget.name,
              price: widget.price,
              description: widget.description,
              onChanged: (v) {
                setState(() {
                  slectedQty = v;
                });
              },
              qty: slectedQty,
            ),
            promo(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Est. Total'.toUpperCase(),
                    spacing: 5,
                    fontSize: 18,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: '\$ ${widget.price * slectedQty}',
                    fontSize: 22,
                    color: Colors.red.shade200,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Gap(20),
            CustomButton(
              text: "Checkout",
              image: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => PlaceOrder(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price,
                      description: widget.description,
                      quantity: slectedQty,
                      total: (widget.price * slectedQty),
                    ),
                  ),
                );
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}

Widget promo() {
  return Column(
    children: [
      Gap(20),
      Divider(),
      Gap(15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            SvgPicture.asset('assets/svgs/promo.svg', width: 25),
            Gap(20),
            CustomText(
              text: 'Add promo code',
              fontSize: 18,
              color: Color(0xff333333),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      Gap(15),
      Divider(),
      Gap(15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            SvgPicture.asset('assets/svgs/delivery.svg', width: 25),
            Gap(20),
            CustomText(
              text: 'Delivery',
              fontSize: 18,
              color: Color(0xff333333),
              fontWeight: FontWeight.w500,
            ),
            Spacer(),
            CustomText(
              text: 'Free'.toUpperCase(),
              fontSize: 18,
              color: Color(0xff333333),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      Gap(15),
      Divider(),
    ],
  );
}
