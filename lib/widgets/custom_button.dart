import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.image,required this.onTap});
  final String text;
  final bool image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    bool isSvg = image;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13,vertical: 15),
        width: double.infinity,
        color: Color(0xff000000),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg?SvgPicture.asset('assets/svgs/shopping bag.svg', width: 20):SizedBox.shrink(),
            Gap(15),
            CustomText(
              text: text.toUpperCase(),
              fontSize: 18,
              spacing: 3,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        
      ),
    );
  }
}
