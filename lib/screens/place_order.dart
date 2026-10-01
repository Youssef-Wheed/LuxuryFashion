import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxury_fashion_app/widgets/custom_text.dart';

import '../widgets/custom_appbar.dart';

class PlaceOrder extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(isBlack: false),
      body: Column(
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
        ],
      ),
    );
  }
}
