import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/cards/brand_card.dart';
import 'package:ecommerce_website/app/constants/cards/category_card.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view_widgets/bottom_sheet_of_website.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarPage3 extends StatelessWidget {
  const TabbarPage3({super.key, required this.brandsList, required this.crossAxisCount, required this.fontSizeCustom, required this.itemCountCustom, required this.screenWidth});
  final List<QueryDocumentSnapshot<Object?>> brandsList;
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
          itemCount: brandsList.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          itemBuilder: (BuildContext context, int index) {
            return BrandCard(
              id: index,
              image: brandsList[index]['img'],
              name: brandsList[index]['title'],
              productCount: '12',
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
