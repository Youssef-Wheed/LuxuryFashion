import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key, required this.image, required this.name, required this.price, required this.description});
final String image;
  final String name;
  final double price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(isBlack: false),
    );
  }
}
