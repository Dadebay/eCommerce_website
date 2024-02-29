// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode requestfocusNode;
  final bool isNumber;
  final bool unFocus;
  final bool? isLabel;
  final IconData icon;

  const CustomTextField({
    super.key,
    required this.labelName,
    required this.controller,
    required this.focusNode,
    required this.requestfocusNode,
    required this.isNumber,
    required this.unFocus,
    this.isLabel = false,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: TextFormField(
        style: const TextStyle(color: Colors.black, fontFamily: gilroyMedium),
        cursorColor: Colors.black,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return 'errorEmpty'.tr;
          }

          return null;
        },
        onEditingComplete: () {
          unFocus ? FocusScope.of(context).unfocus() : requestfocusNode.requestFocus();
        },
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        focusNode: focusNode,
        decoration: InputDecoration(
          errorMaxLines: 2,
          errorStyle: const TextStyle(fontFamily: gilroyMedium),
          hintMaxLines: 5,
          helperMaxLines: 5,
          hintText: isLabel! ? labelName.tr : '',
          hintStyle: TextStyle(color: Colors.grey.shade300, fontFamily: gilroyMedium),
          label: isLabel!
              ? null
              : Text(
                  labelName.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade400, fontFamily: gilroyMedium),
                ),
          prefixIconConstraints: const BoxConstraints(minHeight: 60, minWidth: 24),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              icon,
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
    );
  }
}
