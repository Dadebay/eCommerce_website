import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.id,
    required this.image,
    required this.name,
    super.key,
  });
  final String name;
  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 10, top: 15, right: 10),
            decoration: BoxDecoration(borderRadius: borderRadius40, color: Colors.grey, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4), spreadRadius: 1, blurRadius: 5)]),
            child: ClipRRect(
              borderRadius: borderRadius40,
              child: CachedNetworkImage(
                fadeInCurve: Curves.ease,
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius30,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(child: spinKit()),
                errorWidget: (context, url, error) => const Center(
                  child: Text('No Image'),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.only(left: 10, top: 15, right: 10),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(color: Colors.black54, borderRadius: borderRadius40),
              alignment: Alignment.center,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontFamily: gilroyBold, fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
