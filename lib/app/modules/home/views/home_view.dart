import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/search_field.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view_widgets/bottom_sheet_of_website.dart';
import 'package:ecommerce_website/app/modules/home/views/tabbar_pages/tab_bar_page_1.dart';
import 'package:ecommerce_website/app/modules/home/views/tabbar_pages/tab_bar_page_2.dart';
import 'package:ecommerce_website/app/modules/home/views/tabbar_pages/tab_bar_page_3.dart';
import 'package:ecommerce_website/app/modules/home/views/tabbar_pages/tab_bar_page_4.dart';
import 'package:ecommerce_website/app/modules/home/views/tabbar_pages/tab_bar_page_5.dart';
import 'package:ecommerce_website/app/modules/home/views/tabbar_pages/tab_bar_page_6.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CollectionReference brands = FirebaseFirestore.instance.collection('brands_logo');
  List<QueryDocumentSnapshot<Object?>> brandsList = [];
  CollectionReference categories = FirebaseFirestore.instance.collection('categories');
  List<QueryDocumentSnapshot<Object?>> categoriesList = [];
  CollectionReference instagramImages = FirebaseFirestore.instance.collection('instagramImages');
  List<QueryDocumentSnapshot<Object?>> instagramImagesList = [];
  List<QueryDocumentSnapshot<Object?>> oledTV = [];
  CollectionReference posts = FirebaseFirestore.instance.collection('shop_now_items');
  CollectionReference blogs = FirebaseFirestore.instance.collection('blogs');
  List<QueryDocumentSnapshot<Object?>> blogsList = [];

  @override
  void initState() {
    super.initState();
    categories.get().then((value) {
      categoriesList = value.docs;
      setState(() {});
    });
    blogs.get().then((value) {
      blogsList = value.docs;
      setState(() {});
    });

    brands.get().then((value) {
      brandsList = value.docs;
      setState(() {});
    });
    instagramImages.get().then((value) {
      instagramImagesList = value.docs;
      setState(() {});
    });
    posts.get().then((value) {
      oledTV = value.docs;
      setState(() {});
    });
  }

  Widget page(int crossAxisCount, int fontSizeCustom, double itemCountCustom, int categoryCount, double screenWidth) {
    return DefaultTabController(
      length: 6,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: TabBar(
                  indicatorColor: kPrimaryColor,
                  indicator: MaterialIndicator(
                    height: 5,
                    topLeftRadius: 8,
                    topRightRadius: 8,
                    tabPosition: TabPosition.bottom,
                  ),
                  onTap: (index) {},
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyle(fontFamily: gilroyBold, fontSize: 4.sp, color: Colors.black),
                  unselectedLabelStyle: TextStyle(fontFamily: gilroyRegular, fontSize: 3.sp, color: Colors.grey),
                  tabs: const <Widget>[
                    Tab(
                      text: 'Home',
                    ),
                    Tab(
                      text: 'Categories',
                    ),
                    Tab(
                      text: 'Brands',
                    ),
                    Tab(
                      text: 'Products',
                    ),
                    Tab(
                      text: 'Blog',
                    ),
                    Tab(
                      text: 'Contact',
                    ),
                  ]),
            ),
          ];
        },
        body: TabBarView(physics: const NeverScrollableScrollPhysics(), children: [
          // TabbarPage1(
          //   snapshot: oledTV,
          //   instagramImages: instagramImagesList,
          //   crossAxisCount: crossAxisCount,
          //   fontSizeCustom: fontSizeCustom,
          //   itemCountCustom: itemCountCustom,
          //   screenWidth: screenWidth,
          // ),
          // TabbarPage2(
          //   crossAxisCount: categoryCount,
          //   fontSizeCustom: fontSizeCustom,
          //   itemCountCustom: itemCountCustom,
          //   categories: categoriesList,
          //   screenWidth: screenWidth,
          // ),
          // TabbarPage3(brandsList: brandsList, screenWidth: screenWidth, crossAxisCount: crossAxisCount, fontSizeCustom: fontSizeCustom, itemCountCustom: itemCountCustom),
          TabbarPage4(
            crossAxisCount: crossAxisCount,
            fontSizeCustom: fontSizeCustom,
            screenWidth: screenWidth,
          ),
          // TabbarPage5(
          //   crossAxisCount: crossAxisCount,
          //   fontSizeCustom: fontSizeCustom,
          //   screenWidth: screenWidth,
          //   blogs: blogsList,
          // ),
          // TabbarPage6(fontSizeCustom: fontSizeCustom),
          // Container(
          //   color: Colors.amber,
          // ),
          // Container(
          //   color: Colors.amber,
          // ),
          // Container(
          //   color: Colors.amber,
          // ),
          // Container(
          //   color: Colors.amber,
          // ),
          // Container(
          //   color: Colors.red,
          // ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 0;
    int fontSizeCustom = 0;
    int categoryCount = 0;
    double itemCountCustom = 0;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(95.h),
          child: CustomSearchField(),
        ),
        body: DefaultTabController(
          length: 6,
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 1500) {
              crossAxisCount = 5;
              fontSizeCustom = 2;
              categoryCount = 3;
              itemCountCustom = 20.h;
              return page(crossAxisCount, fontSizeCustom, itemCountCustom, categoryCount, constraints.maxWidth);
            } else if (constraints.maxWidth > 1200) {
              crossAxisCount = 4;
              categoryCount = 3;

              fontSizeCustom = 7;
              itemCountCustom = 230.h;
              return page(crossAxisCount, fontSizeCustom, itemCountCustom, categoryCount, constraints.maxWidth);
            } else if (constraints.maxWidth > 720) {
              crossAxisCount = 3;
              categoryCount = 2;

              fontSizeCustom = 10;
              itemCountCustom = 320.h;
              return page(crossAxisCount, fontSizeCustom, itemCountCustom, categoryCount, constraints.maxWidth);
            } else {
              crossAxisCount = 2;
              fontSizeCustom = 14;
              categoryCount = 2;

              itemCountCustom = 520.h;
              return page(crossAxisCount, fontSizeCustom, itemCountCustom, categoryCount, constraints.maxWidth);
            }
          }),
        ));
  }
}
