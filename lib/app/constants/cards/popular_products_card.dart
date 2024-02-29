import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularProductsCard extends StatelessWidget {
  const PopularProductsCard({super.key, required this.fontSizeCustom});
  final int fontSizeCustom;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: Get.size.width,
            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: borderRadius5),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                    child: Image.asset(logo),
                  ),
                ),
                Positioned(
                    left: 3.w,
                    top: 8.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.w),
                      decoration: const BoxDecoration(
                        borderRadius: borderRadius5,
                        color: Colors.black,
                      ),
                      child: Text(
                        "- 13%",
                        style: TextStyle(color: kPrimaryColor, fontFamily: gilroySemiBold, fontSize: fontSizeCustom + 1.5.sp),
                      ),
                    ))
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                "Product Name",
                style: TextStyle(color: Colors.black, fontFamily: gilroyRegular, overflow: TextOverflow.ellipsis, fontSize: fontSizeCustom + 3.5.sp),
              ),
            ),
            Text(
              "\$650.00",
              style: TextStyle(color: Colors.black, overflow: TextOverflow.ellipsis, fontFamily: gilroySemiBold, fontSize: fontSizeCustom + 3.sp),
            ),
          ],
        ),
      ],
    );
  }
}
