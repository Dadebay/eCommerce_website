import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class TopBlackWidget extends StatelessWidget {
  const TopBlackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      color: Colors.black,
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('web_info').doc('info').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return spinKit();
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        snapshot.data!['address'],
                        style: TextStyle(color: kPrimaryColor, fontFamily: gilroyRegular, fontSize: 2.5.sp),
                      ),
                      icon: Icon(
                        IconlyBold.location,
                        size: 3.dm,
                        color: kPrimaryColor,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        snapshot.data!['gmail'],
                        style: TextStyle(color: kPrimaryColor, fontFamily: gilroyRegular, fontSize: 2.5.sp),
                      ),
                      icon: Icon(
                        IconlyBold.message,
                        size: 3.dm,
                        color: kPrimaryColor,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        snapshot.data!['number'],
                        style: TextStyle(color: kPrimaryColor, fontFamily: gilroyRegular, fontSize: 2.5.sp),
                      ),
                      icon: Icon(
                        IconlyBold.call,
                        size: 3.dm,
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
                      ),
                      label: Text(
                        'FR',
                        style: TextStyle(color: kPrimaryColor, fontFamily: gilroyBold, fontSize: 3.sp),
                      ),
                      icon: ClipOval(
                          child: Image.asset(
                        'assets/image/fr.png',
                        fit: BoxFit.cover,
                        width: 6.w,
                        height: 18.h,
                      )),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
                      ),
                      label: Text(
                        'ENG',
                        style: TextStyle(color: kPrimaryColor, fontFamily: gilroyBold, fontSize: 3.sp),
                      ),
                      icon: ClipOval(
                          child: Image.asset(
                        'assets/image/usa.jpg',
                        fit: BoxFit.cover,
                        width: 6.w,
                        height: 19.h,
                      )),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
                      ),
                      label: Text(
                        'RU',
                        style: TextStyle(color: kPrimaryColor, fontFamily: gilroyBold, fontSize: 3.sp),
                      ),
                      icon: ClipOval(
                          child: Image.asset(
                        'assets/image/ru.png',
                        fit: BoxFit.cover,
                        width: 5.5.w,
                        height: 18.h,
                      )),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
