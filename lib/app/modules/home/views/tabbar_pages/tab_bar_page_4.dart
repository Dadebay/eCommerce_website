import 'package:ecommerce_website/app/constants/cards/popular_products_card.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view_widgets/bottom_sheet_of_website.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarPage4 extends StatelessWidget {
  const TabbarPage4({super.key, required this.crossAxisCount, required this.fontSizeCustom, required this.screenWidth});
  final int crossAxisCount;
  final int fontSizeCustom;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: ListView(
        shrinkWrap: true,
        children: [
          GridView.builder(
            itemCount: 15,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            itemBuilder: (BuildContext context, int index) {
              return PopularProductsCard(
                fontSizeCustom: fontSizeCustom,
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, mainAxisSpacing: 25.h, crossAxisSpacing: 8.w),
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
