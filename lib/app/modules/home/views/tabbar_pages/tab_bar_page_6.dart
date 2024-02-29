import 'package:ecommerce_website/app/constants/buttons/agree_button_view.dart';
import 'package:ecommerce_website/app/constants/buttons/custom_text_field.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class TabbarPage6 extends StatelessWidget {
  TabbarPage6({super.key, required this.fontSizeCustom});
  final int fontSizeCustom;
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();
  final TextEditingController textEditingController4 = TextEditingController();
  final TextEditingController textEditingController5 = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          child: Text(
            'Contact US',
            style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, overflow: TextOverflow.ellipsis, fontSize: fontSizeCustom + 5.sp),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            textPart(),
            textFields(),
            const Expanded(child: SizedBox()),
          ],
        )
      ],
    );
  }

  Expanded textFields() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                    labelName: 'Full name', controller: textEditingController1, focusNode: focusNode1, requestfocusNode: focusNode2, isNumber: false, unFocus: true, icon: IconlyLight.profile),
              ),
              Expanded(
                child: CustomTextField(
                    labelName: 'Email', controller: textEditingController2, focusNode: focusNode2, requestfocusNode: focusNode3, isNumber: false, unFocus: true, icon: IconlyLight.message),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child:
                    CustomTextField(labelName: 'Phone', controller: textEditingController3, focusNode: focusNode3, requestfocusNode: focusNode4, isNumber: true, unFocus: true, icon: IconlyLight.call),
              ),
              Expanded(
                child: CustomTextField(
                    labelName: 'Topic of interest',
                    controller: textEditingController4,
                    focusNode: focusNode4,
                    requestfocusNode: focusNode5,
                    isNumber: false,
                    unFocus: true,
                    icon: IconlyLight.info_circle),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 20.h, left: 15, right: 15),
            child: TextFormField(
              style: const TextStyle(color: Colors.black, fontFamily: gilroyMedium),
              cursorColor: Colors.black,
              controller: textEditingController5,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'errorEmpty'.tr;
                }

                return null;
              },
              maxLines: 5,
              textAlign: TextAlign.start,
              focusNode: focusNode5,
              decoration: InputDecoration(
                errorMaxLines: 2,
                errorStyle: const TextStyle(fontFamily: gilroyMedium),
                label: Text(
                  'Message'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade400, fontFamily: gilroyMedium),
                ),
                prefixIconConstraints: const BoxConstraints(minHeight: 60, minWidth: 24),
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    IconlyLight.edit_square,
                    color: Colors.grey,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 35, top: 20, bottom: 20, right: 10),
                border: const OutlineInputBorder(
                  borderRadius: borderRadius15,
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius15,
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: borderRadius15,
                  borderSide: BorderSide(
                    color: kPrimaryColor2,
                    width: 2,
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: borderRadius15,
                  borderSide: BorderSide(
                    color: kPrimaryColor2,
                    width: 2,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: borderRadius15,
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
              ),
            ),
          ),
          AgreeButton(onTap: () {}, name: 'Send', style: false)
        ],
      ),
    );
  }

  Widget textPart() {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Container(
              padding: EdgeInsets.all(3.sp),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: const Icon(
                IconlyBold.location,
                color: Colors.black,
              ),
            ),
            label: Text(
              'Ashgabat city Bagtyyarlyk etrap house 27',
              style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, overflow: TextOverflow.ellipsis, fontSize: fontSizeCustom + 3.5.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: TextButton.icon(
              onPressed: () {},
              icon: Container(
                padding: EdgeInsets.all(3.sp),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                child: const Icon(
                  IconlyBold.message,
                  color: Colors.black,
                ),
              ),
              label: Text(
                'dadebaygurbanow333@gmail.com',
                style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, overflow: TextOverflow.ellipsis, fontSize: fontSizeCustom + 3.5.sp),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Container(
              padding: EdgeInsets.all(3.sp),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: const Icon(
                IconlyBold.call,
                color: Colors.black,
              ),
            ),
            label: Text(
              '+993-62-99-03-44',
              style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, overflow: TextOverflow.ellipsis, fontSize: fontSizeCustom + 3.5.sp),
            ),
          ),
        ],
      ),
    );
  }
}
