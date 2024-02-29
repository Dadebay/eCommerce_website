import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/cards/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarPage3 extends StatelessWidget {
  const TabbarPage3({super.key, required this.brandsList, required this.crossAxisCount, required this.fontSizeCustom, required this.itemCountCustom});
  final List<QueryDocumentSnapshot<Object?>> brandsList;
  final int crossAxisCount;
  final int fontSizeCustom;
  final double itemCountCustom;
  @override
  Widget build(BuildContext context) {
    print(brandsList);
    return SizedBox(
      height: 1300.h + itemCountCustom,
      width: 500.w,
      child: GridView.builder(
        itemCount: brandsList.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            id: index,
            image: brandsList[index]['img'],
            name: brandsList[index]['title'],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, mainAxisSpacing: 25.h, crossAxisSpacing: 8.w),
      ),
    );
  }
}
