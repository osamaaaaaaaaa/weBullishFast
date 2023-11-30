// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webullish_fast/View/Shared/videoPlayer.dart';

import '../../../Models/LiveModel.dart';
import '../../Controller/HomeController.dart';
import '../../Helper/AppColors.dart';

class live extends StatelessWidget {
  List<LiveModel> list = [];
  live({required this.list});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: AppColors.color1,
        body: list.isEmpty
            ? Center(
                child: Text(
                  'No Live yet',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Get.width - 100,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () async {
                            try {
                              await launchUrl(
                                  Uri.parse(list[index].link.toString()));
                            } catch (e) {}
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Text(
                                  '${(index + 1).toString()} -  ',
                                  style: TextStyle(
                                      fontSize: 20, color: AppColors.gold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth: Get.width * 0.8),
                                      child: Text(
                                        list[index].description.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.grey),
                                      ),
                                    ),
                                    Text(
                                      list[index].createdAt.toString(),
                                      style: TextStyle(
                                          fontSize: 15, color: AppColors.gold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
