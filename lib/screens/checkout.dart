import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:luxury_fashion_app/widgets/custom_header.dart';
import 'package:luxury_fashion_app/widgets/custom_text.dart';

import '../widgets/custom_appbar.dart';

class Checkout extends StatelessWidget {
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 130),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    CustomText(
                      text: name.toUpperCase(),
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    Gap(10),
                    SizedBox(
                      width: screenWidth * 0.5,
                      child: CustomText(
                        text: description,
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Gap(30),
                    Row(
                      children: [
                        qty(() {}, 'assets/svgs/min.svg'),
                        Gap(12),
                        CustomText(
                          text: "1",
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        Gap(12),
                        qty(() {}, 'assets/svgs/plus.svg'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget qty(ontap, svg) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400, width: 1),
        ),
        child: SvgPicture.asset(svg),
      ),
    ),
  );
}
