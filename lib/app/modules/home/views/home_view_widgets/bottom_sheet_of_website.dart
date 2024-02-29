import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class BottomSheetOfWebsite extends StatelessWidget {
  const BottomSheetOfWebsite({super.key, required this.fontSizeCustom, required this.screenWidth});
  final int fontSizeCustom;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    print(screenWidth);
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.only(top: 35.h, bottom: 10.h, left: 20.w, right: 20.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Us",
                      style: TextStyle(color: Colors.black, fontFamily: gilroyMedium, fontSize: fontSizeCustom + 2.5.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h, bottom: 15.h, right: 18.w),
                      child: Text(
                        "The exciting contemporary brand BEGLER DISTRIBUTION is known for its attention to detail and premium graphics ",
                        maxLines: 4,
                        style: TextStyle(color: Colors.grey, overflow: TextOverflow.ellipsis, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.3.sp),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.black,
                          size: 3.5.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.black,
                            size: 3.5.sp,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.black,
                          size: 3.5.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Icon(
                            FontAwesomeIcons.tiktok,
                            color: Colors.black,
                            size: 3.5.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              TextWidget('Quick Links', 'FAQs', 'Find store location', 'Privacy Policy', 'Terms of Service', 'Refund Policy'),
              screenWidth > 720 ? TextWidget('Quick Links', 'Wishlist', 'My account', 'Product compare', 'About us', 'Contact us') : const SizedBox.shrink(),
              screenWidth > 720
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Newsletter",
                            style: TextStyle(color: Colors.black, fontFamily: gilroyMedium, fontSize: fontSizeCustom + 2.5.sp),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            child: Text(
                              "Write your email first to know about any information",
                              style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.3.sp),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: Get.size.width,
                            padding: EdgeInsets.symmetric(vertical: 6.5.h, horizontal: 2.w),
                            child: Row(
                              children: [
                                Icon(
                                  IconlyLight.message,
                                  color: Colors.grey.shade700,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Enter your email",
                                    style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.5.sp),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            "2024 Powered by G.Dadebay",
            style: TextStyle(color: Colors.grey.shade500, fontFamily: gilroyMedium),
          )
        ],
      ),
    );
  }

  Widget TextWidget(String title, String subtitle, String subtitle1, String subtitle2, String subtitle3, String subtitle4) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black, fontFamily: gilroyMedium, fontSize: fontSizeCustom + 2.5.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 6.h),
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.5.sp),
            ),
          ),
          Text(
            subtitle1,
            style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.5.sp),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Text(
              subtitle2,
              style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.5.sp),
            ),
          ),
          Text(
            subtitle3,
            style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.5.sp),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Text(
              subtitle4,
              style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.5.sp),
            ),
          ),
        ],
      ),
    );
  }
}
