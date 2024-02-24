import 'package:ecommerce_website/app/constants/buttons/agree_button_view.dart';
import 'package:ecommerce_website/app/constants/buttons/custom_text_field.dart';
import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/constants/widgets/widgets.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();

  Expanded rightSide() {
    return Expanded(
        flex: 2,
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: Get.size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              logo,
                              width: 350,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'BEGLER DISTRIBUTION',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.amber, fontFamily: gilroyBold, fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'User Name',
                              style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, fontSize: 20),
                            ),
                          ),
                          CustomTextField(
                              labelName: 'User Name', controller: textEditingController, focusNode: focusNode, requestfocusNode: focusNode1, isNumber: false, unFocus: false, icon: IconlyLight.user),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 35),
                            child: Text(
                              'Password',
                              style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, fontSize: 20),
                            ),
                          ),
                          CustomTextField(
                              labelName: 'Password', controller: textEditingController1, focusNode: focusNode1, requestfocusNode: focusNode, isNumber: false, unFocus: false, icon: IconlyLight.lock),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: AgreeButton(
                                onTap: () {
                                  if (textEditingController.text == 'admin' && textEditingController1.text == 'admin') {
                                    Get.to(() => const HomeView());
                                  } else {
                                    showSnackBar('Wrong', 'Username or Password is wrong', Colors.red);
                                  }
                                },
                                name: "LOG IN",
                                style: false)))
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 3,
              child: Image.asset(
                'assets/image/2.webp',
                height: Get.size.height,
                fit: BoxFit.cover,
              )),
          rightSide(),
        ],
      ),
    );
  }
}
