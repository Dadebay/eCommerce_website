import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/brands_controller.dart';

class BrandsView extends GetView<BrandsController> {
  const BrandsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BrandsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BrandsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
