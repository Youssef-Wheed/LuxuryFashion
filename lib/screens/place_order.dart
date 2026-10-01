import 'package:flutter/material.dart';

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
    return Scaffold();
  }
}
