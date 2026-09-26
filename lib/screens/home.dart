import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:luxury_fashion_app/widgets/custom_appbar.dart';
import 'package:luxury_fashion_app/widgets/custom_text.dart';

import '../data/data_cover_model.dart';
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
          // 10
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/texts/10.svg",
              width: screenWidth * 0.50,
            ),
          ),

          // October
          Positioned(
            top: 65,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/texts/October.svg",
              width: screenWidth * 0.45,
            ),
          ),

          // Collection
          Positioned(
            top: 115,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/texts/Collection.svg",
              width: screenWidth * 0.40,
            ),
          ),

          // Main Scroll
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ================================
                  // Padded Content
                  // ================================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      children: [
                        const Gap(200),

                        // Cover
                        Image.asset('assets/cover/cover1.png'),

                        const Gap(20),

                        // ================================
                        // Products Grid
                        // ================================
                        GridView.builder(
                          padding: EdgeInsets.zero,
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

                                const Gap(9),

                                CustomText(
                                  text: '\$ ${item.price}',
                                  fontSize: 20,
                                  color: Colors.red.shade200,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            );
                          },
                        ),

                        const Gap(20),

                        // ================================
                        // You May Also Like
                        // ================================
                        CustomText(
                          text: 'YOU MAY ALSO LIKE',
                          fontSize: 26,
                          color: const Color(0xffFCFCFC),
                          fontWeight: FontWeight.w700,
                        ),

                        const Gap(10),

                        Image.asset('assets/svgs/line.png', width: 190),

                        const Gap(30),

                        // ================================
                        // Horizontal Covers List
                        // ================================
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: DataCoverModel.covers.length,
                            itemBuilder: (context, index) {
                              final item = DataCoverModel.covers[index];

                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      item.image,
                                      height: 350,
                                      fit: BoxFit.cover,
                                    ),

                                    const Gap(10),

                                    CustomText(
                                      text: item.description.toUpperCase(),
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const Gap(50),

                        Container(
                          width: 375,
                          height: 340,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Ionicons.logoTwitter,color: Colors.white,size: 30,),
                                  Gap(50),
                                  Icon(Ionicons.logoInstagram,color: Colors.white,size: 30,),
                                  Gap(50),
                                  Icon(Ionicons.logoFacebook,color: Colors.white,size: 30,),
                                ],
                              ),
                              Gap(15),
                              Image.asset('assets/svgs/line.png', width: 230,height: 10,fit: BoxFit.fill,color: Colors.white,),
                              Gap(30),
                              CustomText(text: 'support@openui.design', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                              Gap(5),
                              CustomText(text: '+60 825 876', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                              Gap(5),
                              CustomText(text: '08:00 - 22:00 - Everyday', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                              Gap(30),
                              Image.asset('assets/svgs/line.png', width: 230,height: 10,fit: BoxFit.fill,color: Colors.white,),
                              Gap(40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(text: 'About', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                                  CustomText(text: 'Contact', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                                  CustomText(text: 'Blog', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  // ================================
                  // Full Width Container
                  // ================================
                  Container(
                    width: double.infinity,
                    height: 45.24551010131836,
                    color: Color(0xffC4C4C4),
                    child: Center(
                      child: CustomText(
                        text: "Copyright© OpenUI All Rights Reserved.",
                        fontSize: 16,
                        color: Color(0xff555555),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Bottom Space
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
