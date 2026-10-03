import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomText(
                text: 'Iris Watson'.toUpperCase(),
                fontSize: 20,
                color: Color(0xff1A1A1A),
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
                      CustomText(
                        text: '606-3727 Ullamcorper. Street'.toUpperCase(),
                        fontSize: 15,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(6),
                      CustomText(
                        text: 'Roseville NH 11523'.toUpperCase(),
                        fontSize: 15,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(6),
                      CustomText(
                        text: '(786) 713-8616'.toUpperCase(),
                        fontSize: 15,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.w400,
                      ),
                      Gap(6),
                    ],
                  ),
                ),
                Spacer(),
                SvgPicture.asset('assets/svgs/arrow.svg', width: 25),
              ],
            ),
            Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customContainer(
                  'Add shipping adress',
                  false,
                  'assets/svgs/plus.svg',
                ),
                Gap(30),

                CustomText(
                  text: 'Shipping Method'.toUpperCase(),
                  fontSize: 18,
                  color: Color(0xff888888),
                  fontWeight: FontWeight.w600,
                ),
                Gap(10),
                customContainer(
                  'Pickup at store',
                  true,
                  'assets/svgs/downarrow.svg',
                ),
                Gap(30),
                CustomText(
                  text: 'Payment method'.toUpperCase(),
                  fontSize: 18,
                  color: Color(0xff888888),
                  fontWeight: FontWeight.w600,
                ),
                Gap(10),
                customContainer(
                  'select payment method',
                  false,
                  'assets/svgs/downarrow.svg',
                ),
              ],
            ),

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
