import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../screens/place_order.dart';
import 'custom_text.dart';

class CustomShippingMethod extends StatelessWidget {
  const CustomShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
