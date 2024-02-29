import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class BrandCard extends StatelessWidget {
  final String name;
  final String productCount;
  final String image;
  final int id;
  const BrandCard({
    required this.name,
    required this.id,
    required this.image,
    required this.productCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius30, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 3, spreadRadius: 3)]),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 80,
              top: 20,
              right: 20,
              left: 20,
              child: CachedNetworkImage(
                fadeInCurve: Curves.ease,
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius10,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(child: spinKit()),
                errorWidget: (context, url, error) => const Center(
                  child: Text('No Image'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Divider(
                    color: kPrimaryColor,
                    thickness: 1,
                    height: 1,
                  ),
                  Container(
                    width: Get.size.width,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), color: Colors.white70),
                    child: Column(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(color: Colors.black, fontFamily: gilroySemiBold, fontSize: 20),
                        ),
                        Text(
                          "$randomNumber${' product'.tr}",
                          style: const TextStyle(color: Colors.black, fontFamily: gilroyRegular, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
