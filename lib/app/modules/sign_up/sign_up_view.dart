import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_website/app/constants/buttons/agree_button_view.dart';
import 'package:ecommerce_website/app/constants/buttons/custom_text_field.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  FocusNode focusNode = FocusNode();

  FocusNode focusNode1 = FocusNode();

  FocusNode focusNode2 = FocusNode();

  TextEditingController textEditingController = TextEditingController();

  TextEditingController textEditingController1 = TextEditingController();

  TextEditingController textEditingController2 = TextEditingController();
  String imageURL = '';
  @override
  void initState() {
    super.initState();
    getImageURL();
  }

  getImageURL() async {
    await FirebaseFirestore.instance.collection('login_images').doc('img').get().then((value) {
      imageURL = value['url'];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
              margin: EdgeInsets.only(right: Get.size.width / 2.5),
              child: CachedNetworkImage(
                imageUrl: imageURL,
                fit: BoxFit.cover,
                height: Get.size.height,
                useOldImageOnUrlChange: true,
                placeholder: (context, url) => spinKit(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
          Container(
              margin: EdgeInsets.only(left: Get.size.width / 1.8),
              padding: EdgeInsets.symmetric(horizontal: Get.size.width / 12, vertical: Get.size.width / 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'CREATE ACCOUNT',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber, fontFamily: gilroyBold, fontSize: 10.sp),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                          labelName: 'User Name', controller: textEditingController, focusNode: focusNode, requestfocusNode: focusNode1, isNumber: false, unFocus: false, icon: IconlyLight.user),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.sp),
                        child: CustomTextField(
                            labelName: 'Email', controller: textEditingController1, focusNode: focusNode1, requestfocusNode: focusNode2, isNumber: false, unFocus: false, icon: IconlyLight.message),
                      ),
                      CustomTextField(
                          labelName: 'Password', controller: textEditingController2, focusNode: focusNode2, requestfocusNode: focusNode, isNumber: false, unFocus: false, icon: IconlyLight.lock),
                    ],
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: AgreeButton(
                          onTap: () {
                            final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(textEditingController1.text);
                            if (emailValid) {
                              if (textEditingController.text.isNotEmpty && textEditingController2.text.isNotEmpty) {
                                Get.to(const HomeView());
                              } else {
                                showSnackBar('Wrong', 'Username or Password is wrong', Colors.red);
                              }
                            } else {
                              showSnackBar('Wrong', 'Email valid please try again', Colors.red);
                              textEditingController1.clear();
                            }
                          },
                          name: "SIGN UP",
                          style: false)),
                  Text.rich(
                    TextSpan(
                      text: 'Already signed up?  ',
                      style: TextStyle(fontSize: 4.sp, color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Log in',
                            recognizer: TapGestureRecognizer()..onTap = () => showSnackBar('Not done yet', 'Please wait update', kPrimaryColor),
                            style: TextStyle(decoration: TextDecoration.underline, color: Colors.amber, fontSize: 4.sp)),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterSocialButton(
                        onTap: () {
                          showSnackBar('Not done yet', 'Please wait update', kPrimaryColor);
                        },
                        mini: true,
                        iconColor: Colors.white,
                        buttonType: ButtonType.facebook, // Button type for different type buttons
                      ),
                      FlutterSocialButton(
                        onTap: () {
                          showSnackBar('Not done yet', 'Please wait update', kPrimaryColor);
                        },
                        mini: true,
                        iconColor: Colors.white,
                        buttonType: ButtonType.github, // Button type for different type buttons
                      ),
                      FlutterSocialButton(
                        onTap: () {
                          showSnackBar('Not done yet', 'Please wait update', kPrimaryColor);
                        },
                        mini: true,
                        iconColor: Colors.white,
                        buttonType: ButtonType.google, // Button type for different type buttons
                      ),
                      FlutterSocialButton(
                        onTap: () {
                          showSnackBar('Not done yet', 'Please wait update', kPrimaryColor);
                        },
                        mini: true,
                        iconColor: Colors.white,
                        buttonType: ButtonType.apple, // Button type for different type buttons
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
