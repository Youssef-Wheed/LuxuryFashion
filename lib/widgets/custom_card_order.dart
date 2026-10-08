import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'custom_text.dart';

class CustomCardOrder extends StatefulWidget {
  const CustomCardOrder({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.onChanged,
    required this.qty,
  });
  final String image;
  final String name;
  final double price;
  final String description;
  final Function(int) onChanged;
  final int qty;


  @override
  State<CustomCardOrder> createState() => _CustomCardOrderState();
}

class _CustomCardOrderState extends State<CustomCardOrder> {
  // ignore: non_constant_identifier_names
 late int number ;
 @override
  void initState() {
    number = 1;
    number = widget.qty;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.image, width: 130),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(
              text: widget.name.toUpperCase(),
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            Gap(10),
            SizedBox(
              width: screenWidth * 0.5,
              child: CustomText(
                text: widget.description,
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Gap(30),
            Row(
              children: [
                qty(() {
                  setState(() {
                    if (number <= 1)
                      number = 1;
                    else
                      number--;

                    widget.onChanged(number);
                  });
                }, 'assets/svgs/min.svg'),
                Gap(12),
                CustomText(
                  text: number.toString(),
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                Gap(12),
                qty(() {
                  setState(() {
                    number++;
                    widget.onChanged(number);
                  });
                }, 'assets/svgs/plus.svg'),
              ],
            ),
            Gap(10),
            CustomText(
              text: "\$ ${widget.price}",
              fontSize: 22,
              color: Colors.red.shade200,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ],
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
        child: SvgPicture.asset(svg, width: 27),
      ),
    ),
  );
}
