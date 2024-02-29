import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:flutter/material.dart';


class BannerCard extends StatelessWidget {
  final String image;

  const BannerCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: CachedNetworkImage(
        fadeInCurve: Curves.ease,
        imageUrl: image,
        useOldImageOnUrlChange: true,
        imageBuilder: (context, imageProvider) => Container(
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => spinKit(),
        errorWidget: (context, url, error) => const Center(
          child: Text('No Image'),
        ),
      ),
    );
  }
}
