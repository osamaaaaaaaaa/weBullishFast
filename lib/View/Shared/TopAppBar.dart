import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Controller/HomeController.dart';
import '../../Helper/AppColors.dart';

Widget TopAppBar({
  required title,
}) {
  return GetBuilder<HomeController>(
    init: HomeController(),
    builder: (controller) => Container(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              controller.handleBootmNabBar(0);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: AppColors.gold,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: 20,
          )
        ],
      ),
    ),
  );
}
