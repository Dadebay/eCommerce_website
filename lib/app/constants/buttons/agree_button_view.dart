// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class AgreeButton extends StatelessWidget {
  final Function() onTap;
  final String name;
  final bool style;

  const AgreeButton({
    required this.onTap,
    Key? key,
    required this.name,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(borderRadius: borderRadius15, color: style ? Colors.white : Colors.black, border: style ? Border.all(color: kPrimaryColor2) : const Border()),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          width: Get.size.width,
          child: Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: style ? kPrimaryColor2 : Colors.amber, fontFamily: gilroySemiBold, fontSize: 18),
          ),
        ));
  }
}
