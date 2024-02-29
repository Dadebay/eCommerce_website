import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/cards/banner_card.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  final CollectionReference _collectionRef = FirebaseFirestore.instance.collection('banner_images');

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final List allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var element in allData) {
      images.add(element['img']);
    }
    setState(() {});
  }

  List images = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, count) {
            return images.isEmpty
                ? Center(
                    child: spinKit(),
                  )
                : BannerCard(
                    image: images[index],
                  );
          },
          options: CarouselOptions(
            onPageChanged: (index, CarouselPageChangedReason a) {
              selectedIndex = index;
              setState(() {});
            },
            height: 450.h,
            viewportFraction: 1.0,
            autoPlay: true,
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 2000),
          ),
        ),
        Positioned(
          bottom: 0,
          child: dots(images.length, selectedIndex),
        )
      ],
    );
  }

  SizedBox dots(int bannersLength, int selectedIndex) {
    return SizedBox(
      height: 40,
      width: Get.size.width,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: bannersLength,
          itemBuilder: (BuildContext context, int index) {
            return AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              height: 22,
              width: 21,
              decoration: BoxDecoration(
                  color: selectedIndex == index ? Colors.amber : Colors.grey.shade300,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 3,
                  )),
            );
          },
        ),
      ),
    );
  }
}
