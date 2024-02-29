import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/cards/category_card.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view_widgets/bottom_sheet_of_website.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarPage2 extends StatelessWidget {
  const TabbarPage2({super.key, required this.categories, required this.crossAxisCount, required this.fontSizeCustom, required this.itemCountCustom, required this.screenWidth});
  final List<QueryDocumentSnapshot<Object?>> categories;
  final int crossAxisCount;
  final int fontSizeCustom;
  final double itemCountCustom;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        GridView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          itemBuilder: (BuildContext context, int index) {
            return CategoryCard(
              id: index,
              image: categories[index]['img'],
              name: categories[index]['title'],
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, mainAxisSpacing: 25.h, crossAxisSpacing: 8.w),
        ),
        SizedBox(
          height: 20.h,
        ),
        BottomSheetOfWebsite(fontSizeCustom: fontSizeCustom, screenWidth: screenWidth)
      ],
    );
  }
}
