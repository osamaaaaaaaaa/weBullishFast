// ignore_for_file: file_names, non_constant_identifier_names, prefer_final_fields, prefer_interpolation_to_compose_strings, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish_fast/Models/DailyAdsModel.dart';
import 'package:webullish_fast/Services/ApiConst.dart';
import 'package:webullish_fast/Services/ApiServices.dart';

import '../Helper/AppHelper.dart';
import '../Models/FollowUp.dart';
import '../Models/LiveModel.dart';
import '../Models/PerformanceModel.dart';
import '../Models/TopNotificationModel.dart';
import '../Models/UserModel.dart';
import '../View/Shared/bottomNavBar.dart';
import '../View/Shared/button.dart';
import '../View/Ui/Alerts/Alerts.dart';
import '../View/Ui/Auth/LogIn.dart';
import '../View/Ui/Auth/register.dart';
import '../View/Ui/Home/Home.dart';
import '../View/Ui/faq_screen.dart';
import '../View/Ui/performance/performance.dart';
import '../View/Ui/settings/editProfile.dart';

class HomeController extends GetxController {
  ApiServices _ApiServices = ApiServices();
  List<PerformanceModel> performanceList = [];
  List<TopNotificationModel> topNotifications = [];

  List<FollowUpModel> socilaList = [];
  List<LiveModel> facebookLive = [];
  List<LiveModel> youtubelive = [];
  List<LiveModel> instalive = [];
  List<LiveModel> twitterlive = [];
  StreamController DailyAds = BehaviorSubject();
  StreamController TrainingVideos = BehaviorSubject();
  StreamController WeeklyMagazin = BehaviorSubject();
  StreamController Acheviments = BehaviorSubject();
  StreamController Teams = BehaviorSubject();

  HomeController() {
    init();
    getPerformance();
    getUserProfile();
  }
  Widget content = Home();

  init() {
    getTopNoti();
    getDailyAds();
    getTrainingVideos();
    getWeeklyMagazin();
    getAchivement();
    getTeams();
    // getInstaLive();
    // gettwitterLive();
    // getyoutubeLive();
    // getfaceLive();
    // getSocialPages();
  }

  handleBootmNabBar(i) {
    switch (i) {
      case 0:
        if (content == Home()) {
          return;
        }
        init();

        content = Home();
        update();

        break;

      case 1:
        if (content == performance()) {
          return;
        }

        content = performance();
        update();

        break;
      case 2:
        if (content == editProfile()) {
          return;
        }
        if (user?.name == 'Guest') {
          Get.to(() => register());
          return;
        }

        content = editProfile();
        update();

        break;
      case 3:
        if (content == alerts()) {
          return;
        }
        if (user?.name == 'Guest') {
          Get.to(() => register());
          return;
        }
        content = alerts();
        update();

        break;
      case 4:
        if (content == FaqScreen()) {
          return;
        }
        content = FaqScreen();
        update();

        break;
      default:
    }
  }

  User? user;
  bool userLoding = true;
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  getUserProfile() async {
    try {
      bool userLoding = true;

      await _ApiServices.getRequestMap(url: apiConst.userByID).then((value) {
        if (value['error'] == null) {
          user = User.fromJson(value['user']);
          name.text = user!.name.toString();
          email.text = user!.email.toString();
          userLoding = false;

          update();
          return;
        }
      });
    } catch (e) {
      userLoding = false;
      print(e);
    }
  }

  getTopNoti() async {
    await _ApiServices.getRequestList(url: 'api/top_notification/show_all')
        .then((value) {
      if (value.isNotEmpty && value[0]['error'] != null) {
        //  AppHelper.errorsnackbar("top:${value}");

        return;
      }
      for (var e in value) {
        topNotifications.add(TopNotificationModel.fromJson(e));

        update();
      }
      update();
    });
    getTopNotificationsFullText();
    update();
  }

  String getTopNotificationsFullText() {
    String fullText = '';

    topNotifications.forEach((element) {
      if (element != null) {
        fullText += element.name! +
            '  -|-  ' +
            element.description.toString() +
            '    ⚪  ️  ';
      }
    });

    return fullText;
  }

  Future<DailyAdsModel> getDailyAds() async {
    await _ApiServices.getRequestList(url: apiConst.dailyAds).then((value) {
      if (value[0]['error'] == null) {
        DailyAds.add(value);
        update();
      }
      return DailyAdsModel.fromJson(value[0]);
    });
    return DailyAdsModel(name: "elsayed");
  }

  getTrainingVideos() async {
    await _ApiServices.getRequestList(url: apiConst.trainingVideos)
        .then((value) {
      if (value[0]['error'] == null) {
        TrainingVideos.add(value);
        update();
      }
    });
  }

  getWeeklyMagazin() async {
    await _ApiServices.getRequestList(url: apiConst.weeklyMagazine)
        .then((value) {
      if (value[0]['error'] == null) {
        WeeklyMagazin.add(value);
        update();
      }
    });
  }

  getAchivement() async {
    await _ApiServices.getRequestList(url: apiConst.achievment).then((value) {
      if (value[0]['error'] == null) {
        Acheviments.add(value);
        update();
      }
    });
  }

  getTeams() async {
    await _ApiServices.getRequestList(url: apiConst.teams).then((value) {
      if (value[0]['error'] == null) {
        Teams.add(value);
        update();
      }
    });
  }

  getPerformance() async {
    try {
      performanceList.clear();
      await _ApiServices.getRequestMap(url: apiConst.performance).then((value) {
        if (value.isNotEmpty && value['error'] != null) {
          return;
        }

        for (var e in value['data']) {
          performanceList.add(PerformanceModel.fromJson(e));

          update();
        }
        update();
      });
    } catch (e) {}
    update();
  }

  double right = 0;
  double field = 0;
  double precent = 0;
  calcPerformancePercentage(i) {
    precent = 0;
    right = 0;
    update();
    for (var element in performanceList[i].performance!) {
      if (element.reached_min! < (int.tryParse(element.target!))!) {
        right++;
      }
      precent = right / performanceList[i].performance!.length;
      update();
    }
  }

  updateProfilr({required name, required email, required password}) async {
    if (user?.name == 'Guest' || user == null) {
      AppHelper.errorsnackbar('Not Allowed');
      return;
    }
    User model = User(
      name: name,
      email: email,
      password: password,
    );
    try {
      await ApiServices()
          .postRequestMap(url: 'api/updateProfile', body: model.toJson())
          .then((value) {
        if (value.isNotEmpty && value['error'] != null) {
          AppHelper.errorsnackbar("Update :${value['error']}");

          return;
        }

        Get.offAll(() => bottomNavBar());

        update();
      });
      update();
    } catch (e) {
      print(e);
    }
  }

  getSocialPages() async {
    socilaList.clear();
    await ApiServices().getRequestList(url: apiConst.follow).then((value) {
      if (value.isNotEmpty && value[0]['error'] != null) {
        //  AppHelper.errorsnackbar("Teams:${value[0]['error']}");

        return;
      }
      for (var e in value) {
        socilaList.add(FollowUpModel.fromJson(e));

        update();
      }
      update();
    });
    update();
  }

  getInstaLive() async {
    instalive.clear();
    await ApiServices()
        .getRequestList(url: 'api/liveinstagram/show_all')
        .then((value) {
      if (value.isNotEmpty && value[0]['error'] != null) {
        //  AppHelper.errorsnackbar("Teams:${value[0]['error']}");

        return;
      }
      for (var e in value) {
        instalive.add(LiveModel.fromJson(e));

        update();
      }
      update();
    });
    update();
  }

  getfaceLive() async {
    facebookLive.clear();
    await ApiServices()
        .getRequestList(url: 'api/livefacebook/show_all')
        .then((value) {
      if (value.isNotEmpty && value[0]['error'] != null) {
        //  AppHelper.errorsnackbar("Teams:${value[0]['error']}");

        return;
      }
      for (var e in value) {
        facebookLive.add(LiveModel.fromJson(e));

        update();
      }
      update();
    });
    update();
  }

  gettwitterLive() async {
    twitterlive.clear();
    await ApiServices()
        .getRequestList(url: 'api/livetwitter/show_all')
        .then((value) {
      if (value.isNotEmpty && value[0]['error'] != null) {
        //  AppHelper.errorsnackbar("Teams:${value[0]['error']}");

        return;
      }
      for (var e in value) {
        twitterlive.add(LiveModel.fromJson(e));

        update();
      }
      update();
    });
    update();
  }

  getyoutubeLive() async {
    youtubelive.clear();
    await ApiServices()
        .getRequestList(url: 'api/liveyoutube/show_all')
        .then((value) {
      if (value.isNotEmpty && value[0]['error'] != null) {
        //  AppHelper.errorsnackbar("Teams:${value[0]['error']}");

        return;
      }
      for (var e in value) {
        youtubelive.add(LiveModel.fromJson(e));

        update();
      }
      update();
    });
    update();
  }

  deleteacc() {
    Get.defaultDialog(
        title: 'are you sure ? ',
        content: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: button(
                      color: Colors.green,
                      title: "Back",
                      height: 30,
                      fontColor: Colors.white,
                      fontsize: 16,
                      width: 120),
                ),
                InkWell(
                  onTap: () async {
                    _deleteAcc();
                  },
                  child: button(
                      color: Colors.red,
                      title: "Confirm",
                      height: 30,
                      fontsize: 16,
                      width: 120,
                      fontColor: Colors.white),
                ),
              ],
            )
          ],
        ));
  }

  _deleteAcc() async {
    var prefs = await SharedPreferences.getInstance();

    await ApiServices()
        .postRequestMap(url: 'api/delete', body: {}).then((value) => {
              if (value['error'] == null)
                {
                  if (value['status'] == true)
                    {
                      AppHelper.errorsnackbar(value['message']),
                      prefs.clear(),
                      Get.offAll(Login()),
                    }
                }
            });
  }
}
