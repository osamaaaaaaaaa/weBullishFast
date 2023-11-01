// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../Controller/HomeController.dart';
import '../../../Helper/AppColors.dart';
import '../../Shared/TopAppBar.dart';

class performancedetails extends StatelessWidget {
  int? i;
  String? month;
  performancedetails({required this.i, required this.month});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
          backgroundColor: AppColors.color1,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TopAppBar(title: 'Performance ${month}'),
                const SizedBox(
                  height: 20,
                ),
                _widget(context, 'Symbol', 'P&L Reached', 'P&L Target',
                    ' Additional\n Comments'),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.performanceList[i!].performance?.length,
                    itemBuilder: (context, index) => controller
                            .performanceList.isEmpty
                        ? const Text('')
                        : _widget2(
                            context,
                            controller
                                .performanceList[i!].performance?[index].sympol,
                            controller
                                .performanceList[i!].performance?[index].target,
                            '${controller.performanceList[i!].performance?[index].reached_min}-${controller.performanceList[i!].performance?[index].reached_max} %',
                            controller.performanceList[i!].performance?[index]
                                .comment,
                            reached_min: controller.performanceList[i!]
                                .performance?[index].reached_min)),
                const SizedBox(
                  height: 20,
                ),
                if (controller.performanceList.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: LinearPercentIndicator(
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 20.0,
                        leading: Text(
                          "Success",
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: new Text("Fail",
                            style: const TextStyle(color: Colors.white)),
                        percent: controller.precent,
                        center: Text(
                            "${(controller.precent * 100).toStringAsFixed(0)}% Successful Predictions",
                            style: const TextStyle(color: Colors.white)),
                        barRadius: const Radius.circular(15),
                        progressColor: Colors.green,
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          )),
    );
  }
}

Widget _widget(context, title1, title2, title3, title4) => Container(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.grey,
            ),
            child: Text(
              title1.toString(),
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.grey,
            ),
            child: Text(
              title2.toString(),
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.grey,
            ),
            child: Text(
              title3.toString(),
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.grey,
            ),
            child: Text(
              title4.toString(),
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

Widget _widget2(context, title1, title3, title2, title4,
        {required reached_min}) =>
    Container(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.grey,
            ),
            child: Text(
              title1.toString(),
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.grey,
            ),
            child: Text(
              title2.toString(),
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: int.tryParse(title3)! < reached_min
                    ? Colors.red
                    : Colors.green),
            child: Text(
              title3.toString(),
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.grey,
            ),
            child: Text(
              title4.toString(),
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
