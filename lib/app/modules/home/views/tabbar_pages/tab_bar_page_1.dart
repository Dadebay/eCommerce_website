import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/cards/gradient_card.dart';
import 'package:ecommerce_website/app/constants/cards/popular_products_Card.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view_widgets/banners.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view_widgets/bottom_sheet_of_website.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabbarPage1 extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object?>> snapshot;
  final List<QueryDocumentSnapshot<Object?>> instagramImages;
  const TabbarPage1(
      {super.key, required this.snapshot, required this.crossAxisCount, required this.fontSizeCustom, required this.itemCountCustom, required this.instagramImages, required this.screenWidth});
  final int crossAxisCount;
  final int fontSizeCustom;
  final double itemCountCustom;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: <Widget>[
          const Banners(),
          gradientCard(),
          Padding(
            padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
            child: Text(
              'Popular products',
              style: TextStyle(color: Colors.black, fontFamily: gilroyBold, fontSize: fontSizeCustom + 6.sp),
            ),
          ),
          gridView(crossAxisCount, fontSizeCustom, itemCountCustom),
          instagramshop(),
          BottomSheetOfWebsite(fontSizeCustom: fontSizeCustom, screenWidth: screenWidth)
        ],
      ),
    );
  }

  Column instagramshop() {
    return Column(
      children: [
        Text(
          'Instagram shop',
          style: TextStyle(color: Colors.black, fontFamily: gilroyBold, fontSize: fontSizeCustom + 6.sp),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
          child: Text.rich(
            TextSpan(
              text: "Become a member of the  ",
              style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.3.sp),
              children: <TextSpan>[
                TextSpan(
                  text: '@beglerdistribution',
                  style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.3.sp),
                ),
                TextSpan(
                  text: ' community',
                  style: TextStyle(color: Colors.grey, fontFamily: gilroyRegular, fontSize: fontSizeCustom + 2.3.sp),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 250.h,
          child: Center(
            child: instagramImages.isEmpty
                ? spinKit()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: instagramImages.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 35.h),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 50.w + fontSizeCustom.w,
                        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: borderRadius10,
                        ),
                        child: CachedNetworkImage(
                          fadeInCurve: Curves.ease,
                          imageUrl: instagramImages[index]['img'],
                          useOldImageOnUrlChange: true,
                          imageBuilder: (context, imageProvider) => Container(
                            width: Get.size.width,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius10,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => spinKit(),
                          errorWidget: (context, url, error) => const Center(
                            child: Text('No Image'),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        )
      ],
    );
  }

  Widget gridView(int crossAxisCount, fontSizeCustom, double itemCountCustom) {
    return SizedBox(
      height: 800.h + itemCountCustom,
      width: 500.w,
      child: GridView.builder(
        itemCount: 15,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        itemBuilder: (BuildContext context, int index) {
          return PopularProductsCard(
            fontSizeCustom: fontSizeCustom,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, mainAxisSpacing: 25.h, crossAxisSpacing: 8.w),
      ),
    );
  }

  gradientCard() {
    return snapshot.isEmpty
        ? spinKit()
        : Container(
            margin: EdgeInsets.symmetric(vertical: 40.h),
            height: 400.h,
            child: Row(
              children: [
                GradientCard(
                  color1: const Color(0xFF3366FF),
                  color2: const Color(0xFF00CCFF),
                  title: snapshot[0]['title'],
                  subtitle: snapshot[0]['subtitle'],
                  image: snapshot[0]['img'],
                ),
                GradientCard(
                  color1: Colors.orange,
                  color2: Colors.orange.shade100,
                  title: snapshot[1]['title'],
                  subtitle: snapshot[1]['subtitle'],
                  image: snapshot[1]['img'],
                ),
                GradientCard(
                  color1: Colors.purple.shade700,
                  color2: Colors.purple.shade100,
                  title: snapshot[2]['title'],
                  subtitle: snapshot[2]['subtitle'],
                  image: snapshot[2]['img'],
                ),
              ],
            ),
          );
  }
}
