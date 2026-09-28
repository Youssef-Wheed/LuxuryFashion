import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_text.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomText(
            text: name.toUpperCase(),
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            spacing: 10,
          ),
        ),

        Gap(5),
        Image.asset(
          'assets/svgs/line.png',
          color: Color(0xff555555),
          width: 150,
        ),
        Gap(20),

      ],
    );
  }
}
