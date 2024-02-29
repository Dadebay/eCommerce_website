import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.fontSizeCustom, required this.image, required this.date, required this.title, required this.subtitle});
  final int fontSizeCustom;
  final String image;
  final String date;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius10, border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: Get.size.width,
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: borderRadius5),
              child: Center(
                child: CachedNetworkImage(
                  fadeInCurve: Curves.ease,
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadius10,
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
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h, left: 4.0.w, right: 4.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, overflow: TextOverflow.ellipsis, fontSize: fontSizeCustom + 3.5.sp),
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 3,
                  style: TextStyle(color: Colors.grey, overflow: TextOverflow.ellipsis, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 3.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//˙