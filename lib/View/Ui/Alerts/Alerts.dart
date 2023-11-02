import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/AlertsController.dart';
import '../../../Helper/AppColors.dart';
import '../../Shared/TopAppBar.dart';
import '../../Shared/videoImage.dart';
import '../subscriptions/subscribe.dart';
import 'AlertsDetails.dart';

class alerts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<alertsController>(
      init: alertsController(),
      builder: (controller) => Scaffold(
          backgroundColor: AppColors.color1,
          body: controller.loading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : !controller.IsSubscribe
                  ? subscribe()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          TopAppBar(title: "Alerts"),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 100,
                            child: ListView.builder(
                              itemCount: controller.alertsList.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(() => alertsDetails(
                                      image: controller.alertsList[index].image,
                                      video: controller.alertsList[index].video,
                                      body: controller
                                          .alertsList[index].description,
                                      senttime: controller
                                          .alertsList[index].sendTime
                                          .toString(),
                                      title: controller.alertsList[index].name
                                          .toString()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: controller.alertsList[index]
                                                      .image !=
                                                  null
                                              ? Image.network(
                                                  controller
                                                      .alertsList[index].image
                                                      .toString(),
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        backgroundColor:
                                                            Colors.white,
                                                      ),
                                                    );
                                                  },
                                                  width: Get.width * 0.2,
                                                )
                                              : videoimageviww2(
                                                  link: controller
                                                      .alertsList[index]
                                                      .video!)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            controller.alertsList[index].name
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            controller
                                                .alertsList[index].sendTime
                                                .toString(),
                                            style: TextStyle(
                                                color: AppColors.gold,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )),
    );
  }
}
