// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_element, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish_fast/Controller/HomeController.dart';
import 'package:webullish_fast/Helper/AppColors.dart';
import 'package:webullish_fast/View/Shared/Acheviment.dart';
import 'package:webullish_fast/View/Shared/followus.dart';
import 'package:webullish_fast/View/Shared/team.dart';
import 'package:webullish_fast/View/Shared/weeklyMagazine.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../Shared/BreakingNotifications.dart';
import '../../Shared/characters.dart';
import '../../Shared/liveSocial.dart';
import '../../Shared/videoPlayer.dart';
import '../../Shared/whywebullish.dart';
import '../Auth/LogIn.dart';
import '../MagazineDetails.dart';
import '../settings/deleteAccount.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.color1,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Text(
                        controller.user == null
                            ? 'Hi'
                            : 'Hi ${controller.user?.name.toString()},',
                        style: TextStyle(
                            color: AppColors.gold,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _setting(context: context);
                      },
                      child: Icon(
                        Icons.settings,
                        color: AppColors.gold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'Top Notifications',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                controller.topNotifications.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : BreakingNotifications(
                        isLoading: false,
                        data: controller.getTopNotificationsFullText(),
                        dataCount: controller.topNotifications.length,
                      ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  // onTap: () {
                  //   controller.getTeams();
                  // },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      'Daily ads',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                StreamBuilder(
                    stream: controller.DailyAds.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('error');
                      }

                      if (snapshot.hasData) {
                        return SizedBox(
                            height: 250,
                            // width: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(() => OneVideoCtrl(
                                      name: snapshot.data![index]["name"]
                                          .toString(),
                                      url: snapshot.data![index]["video"]
                                          .toString()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child:
                                        //  Text(snapshot.data[index]["image"]
                                        //     .toString())
                                        _videoimageviw(
                                            image: snapshot.data?[index]
                                                    ["image"]
                                                .toString()),
                                  ),
                                ),
                              ),
                            ));
                      }
                      return CircularProgressIndicator();
                    }),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'Follow us on',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: const Text(
                    'Find us on all social media platforms',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                followus(),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'Live training',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: const Text(
                    'Watch us closely and get all new',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                liveSocial(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'See our analytics',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder(
                    stream: controller.TrainingVideos.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('error');
                      }

                      if (snapshot.hasData) {
                        return SizedBox(
                            height: 250,
                            // width: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(() => OneVideoCtrl(
                                      name: snapshot.data![index]["name"]
                                          .toString(),
                                      url: snapshot.data![index]["video"]
                                          .toString()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child:
                                        //  Text(snapshot.data[index]["image"]
                                        //     .toString())
                                        _videoimageviw(
                                            image: snapshot.data?[index]
                                                    ["image"]
                                                .toString()),
                                  ),
                                ),
                              ),
                            ));
                      }
                      return CircularProgressIndicator();
                    }),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'Weekly Magazine',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: const Text(
                    'Stay Bullish for the week ahead',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                StreamBuilder(
                    stream: controller.WeeklyMagazin.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('error');
                      }

                      if (snapshot.hasData) {
                        return SizedBox(
                            height: 165,
                            // width: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(() => MagazineDetails(
                                      name: snapshot.data?[index]["name"],
                                      author: snapshot.data?[index]["author"],
                                      datesend: snapshot.data?[index]
                                          ["datesend"],
                                      image: snapshot.data?[index]["image"],
                                      body: snapshot.data?[index]
                                          ["description"]));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child:
                                          //  Text(snapshot.data[index]["image"]
                                          //     .toString())
                                          weeklyMagazine(
                                              image: snapshot.data?[index]
                                                  ["image"],
                                              title: snapshot.data?[index]
                                                  ["name"])),
                                ),
                              ),
                            ));
                      }
                      return CircularProgressIndicator();
                    }),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    'Recent Achievements',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: const Text(
                    'Despite the constant challenge in the stock market, we manage to pull off memorable achievements',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                StreamBuilder(
                    stream: controller.Acheviments.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('error');
                      }

                      if (snapshot.hasData) {
                        return SizedBox(
                            height: 260,
                            // width: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  // Get.to(() => OneVideoCtrl(
                                  //     name: controller.dailyAdsList[index].name
                                  //         .toString(),
                                  //     url: controller.dailyAdsList[index].video
                                  //         .toString()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child:
                                          //  Text(snapshot.data[index]["image"]
                                          //     .toString())
                                          acheviment(
                                              date: snapshot.data?[index]
                                                  ["name"],
                                              title: snapshot.data?[index]
                                                  ["description"])),
                                ),
                              ),
                            ));
                      }
                      return CircularProgressIndicator();
                    }),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    'Team & Advisors',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: const Text(
                    'Our team of top tier technology and investment experts are ready to work day and night to create a welcoming atmosphere and expansive access to financial services, equity analysis and maximized personal potential.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                StreamBuilder(
                    stream: controller.Teams.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('error');
                      }

                      if (snapshot.hasData) {
                        return SizedBox(
                            height: 280,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  // Get.to(() => OneVideoCtrl(
                                  //     name: controller.dailyAdsList[index].name
                                  //         .toString(),
                                  //     url: controller.dailyAdsList[index].video
                                  //         .toString()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child:
                                          //  Text(snapshot.data[index]["image"]
                                          //     .toString())
                                          teamperson(
                                              image: snapshot.data?[index]
                                                  ["image"],
                                              desc: snapshot.data?[index]
                                                  ["description"],
                                              name: snapshot.data?[index]
                                                  ["name"])),
                                ),
                              ),
                            ));
                      }
                      return CircularProgressIndicator();
                    }),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'HOW ARE WE ?',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                CharacterListingScreen(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    'Why Mbullish..?',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                whywebullish()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _videoimageviw({required image}) => Container(
      child: ClipRRect(
          child: Image.network(
        image,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          );
        },
      )),
    );
_setting({required context}) => showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          padding: const EdgeInsets.all(15),
          color: AppColors.color2,
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.clear();

                  Get.offAll(() => Login());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: AppColors.gold,
                    ),
                    Text(
                      'Sign Out',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => deleteAcc());
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    Text(
                      'Delete Account',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
