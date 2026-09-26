import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:luxury_fashion_app/models/product_model.dart';
import 'package:luxury_fashion_app/widgets/custom_appbar.dart';
import 'package:luxury_fashion_app/widgets/custom_text.dart';

import '../data/data_product_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff111111),

      appBar: const CustomAppbar(isBlack: true),

      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/texts/10.svg",
              width: screenWidth * 0.50,
            ),
          ),

          Positioned(
            top: 65,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/texts/October.svg",
              width: screenWidth * 0.45,
            ),
          ),

          Positioned(
            top: 115,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/texts/Collection.svg",
              width: screenWidth * 0.40,
            ),
          ),

          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Gap(200),

                    Image.asset('assets/cover/cover1.png'),

                    const Gap(20),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 400,
                          ),
                      itemCount: ProductData.products.length,
                      itemBuilder: (context, index) {
                        final item = ProductData.products[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.image,
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),

                            const Gap(8),

                            CustomText(
                              text: item.name,
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),

                            CustomText(
                              text: item.description,
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                Gap(9),
                            CustomText(
                              text: '\$ ${item.price.toString()}',
                              fontSize: 20,
                              color: Colors.red.shade200,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
