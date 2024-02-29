import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({super.key, required this.title, required this.subtitle, required this.color1, required this.color2, required this.image});
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 10.sp),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1, color2], begin: const FractionalOffset(0.0, 0.0), end: const FractionalOffset(1.0, 0.0), stops: const [0.0, 1.0], tileMode: TileMode.clamp),
        ),
        padding: EdgeInsets.all(5.sp),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontFamily: gilroyBold, fontSize: 6.sp),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    subtitle,
                    style: TextStyle(color: Colors.black, fontFamily: gilroyRegular, fontSize: 4.sp),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0.5, padding: EdgeInsets.all(4.sp)),
                    child: Text(
                      'Shop Now',
                      style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, fontSize: 4.sp),
                    ))
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CachedNetworkImage(
                fadeInCurve: Curves.ease,
                imageUrl: image,
                alignment: Alignment.bottomRight,
                useOldImageOnUrlChange: true,
                imageBuilder: (context, imageProvider) => Container(
                  width: 80.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => spinKit(),
                errorWidget: (context, url, error) => const Center(
                  child: Text('No Image'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
