import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/modules/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CustomSearchField extends StatelessWidget {
  CustomSearchField({super.key});
  TextEditingController searchEditingController = TextEditingController();

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: const BoxDecoration(color: Colors.white, border: Border.fromBorderSide(BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Image.asset(
            logo,
            width: 30.w,
            height: 35.h,
            fit: BoxFit.contain,
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black, fontFamily: gilroyMedium),
                cursorColor: Colors.black,
                controller: searchEditingController,
                focusNode: focusNode,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  errorStyle: const TextStyle(fontFamily: gilroyMedium),
                  hintMaxLines: 1,
                  helperMaxLines: 1,
                  hintStyle: TextStyle(color: Colors.grey.shade300, fontFamily: gilroyMedium),
                  hintText: 'Search our store'.tr,
                  suffixIconConstraints: const BoxConstraints(minHeight: 60, minWidth: 24),
                  suffixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.all(2),
                    color: Colors.black,
                    child: const Icon(
                      IconlyLight.search,
                      color: kPrimaryColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor2, width: 2),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor2, width: 2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: borderRadius15,
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const SignUpView());
                },
                child: Icon(
                  IconlyLight.profile,
                  color: Colors.black,
                  size: 6.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Icon(
                  IconlyLight.heart,
                  color: Colors.black,
                  size: 6.sp,
                ),
              ),
              Icon(
                IconlyLight.buy,
                size: 7.sp,
                color: Colors.black,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
