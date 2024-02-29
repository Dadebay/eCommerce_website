import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/cards/blog_card.dart';
import 'package:ecommerce_website/app/constants/cards/popular_products_card.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view_widgets/bottom_sheet_of_website.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarPage5 extends StatelessWidget {
  const TabbarPage5({super.key, required this.crossAxisCount, required this.fontSizeCustom, required this.screenWidth, required this.blogs});
  final int crossAxisCount;
  final int fontSizeCustom;
  final double screenWidth;
  final List<QueryDocumentSnapshot<Object?>> blogs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: ListView(
        shrinkWrap: true,
        children: [
          GridView.builder(
            itemCount: blogs.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            itemBuilder: (BuildContext context, int index) {
              return BlogCard(
                fontSizeCustom: fontSizeCustom,
                image: blogs[index]['img'],
                date: blogs[index]['date'],
                title: blogs[index]['title'],
                subtitle: blogs[index]['subtitle'],
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, childAspectRatio: 0.8, mainAxisSpacing: 25.h, crossAxisSpacing: 8.w),
          ),
          SizedBox(
            height: 20.h,
          ),
          BottomSheetOfWebsite(fontSizeCustom: fontSizeCustom, screenWidth: screenWidth)
        ],
      ),
    );
  }
}
