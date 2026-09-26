import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.isBlack});
  final bool isBlack;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    bool isblack = isBlack;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: isblack ? Color(0xff1111111) : Colors.white,
        leading: SvgPicture.asset(
          "assets/svgs/Menu.svg",
          color: isblack ? Colors.white : Color(0xff1111111),
        ),
        title: SvgPicture.asset(
          "assets/logo/logo-bg.svg",
          color: isblack ? Colors.white : Color(0xff1111111),
        ),
        centerTitle: true,
        leadingWidth: 25,
        actions: [
          SvgPicture.asset(
            "assets/svgs/Search.svg",
            color: isblack ? Colors.white : Color(0xff1111111),
          ),
          Gap(20),
          SvgPicture.asset(
            "assets/svgs/shopping bag.svg",
            color: isblack ? Colors.white : Color(0xff1111111),
          ),
        ],
      ),
    );
  }
}
