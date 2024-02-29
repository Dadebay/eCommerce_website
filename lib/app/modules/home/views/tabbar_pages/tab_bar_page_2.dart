import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/cards/category_card.dart';
import 'package:ecommerce_website/app/constants/cards/popular_products_Card.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarPage2 extends StatelessWidget {
  const TabbarPage2({super.key, required this.categories, required this.crossAxisCount, required this.fontSizeCustom, required this.itemCountCustom});
  final List<QueryDocumentSnapshot<Object?>> categories;
  final int crossAxisCount;
  final int fontSizeCustom;
  final double itemCountCustom;
  @override
  Widget build(BuildContext context) {
    print(categories.length);
    return SizedBox(
      height: 1300.h + itemCountCustom,
      width: 500.w,
      child: GridView.builder(
        itemCount: categories.length,
        physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
