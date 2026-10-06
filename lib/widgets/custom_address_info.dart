import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'custom_text.dart';

class CustomAddressInfo extends StatelessWidget {
  const CustomAddressInfo({super.key, this.saveAdress, this.onTap});

  final dynamic saveAdress;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  "${saveAdress['firstName'] + " " + saveAdress['lastName']}"
                      .toUpperCase(),
                  fontSize: 20,
                  color: Color(0xff1A1A1A),
                  fontWeight: FontWeight.w900,
                ),
                CustomText(
                  text:
                  "${saveAdress['address'] + " " + saveAdress['city']}"
                      .toUpperCase(),
                  fontSize: 15,
                  color: Color(0xff555555),
                  fontWeight: FontWeight.w400,
                ),
                Gap(6),
                CustomText(
                  text:
                  "${saveAdress['state'] + " " + saveAdress['zipCode']}"
                      .toUpperCase(),
                  fontSize: 15,
                  color: Color(0xff555555),
                  fontWeight: FontWeight.w400,
                ),
                Gap(6),
                CustomText(
                  text: "${saveAdress['phone']}"
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
    );
  }
}
