import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'custom_button.dart';
import 'custom_text.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 480,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Align(
                  child: Icon(CupertinoIcons.clear),
                  alignment: Alignment.centerRight,
                ),
              ),
              Gap(20),
              CustomText(
                text: "payment success".toUpperCase(),
                spacing: 5,
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              Gap(20),
              SvgPicture.asset('assets/pop/done.svg', width: 60),
              Gap(20),
              CustomText(
                text: "You payment was success",
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: "payment ID 15263541",
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              Gap(15),
              Image.asset(
                'assets/svgs/line.png',
                width: 190,
                color: Color(0xff555555),
              ),
              Gap(15),
              CustomText(
                text: "Rate your Purchase",
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/pop/emogi1.svg'),
                  Gap(20),
                  SvgPicture.asset('assets/pop/emogi3.svg'),
                  Gap(20),
                  SvgPicture.asset('assets/pop/emogi2.svg'),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Submit",
                      image: false,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: CustomButton(
                      text: "Cancel",
                      image: false,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
