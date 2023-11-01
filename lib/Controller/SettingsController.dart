import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish_fast/Services/ApiConst.dart';

import 'package:webullish_fast/View/Ui/Auth/LogIn.dart';

import '../Helper/AppHelper.dart';
import '../Models/UserModel.dart';
import '../Services/apiServices.dart';
import '../View/Shared/bottomNavBar.dart';
import '../View/Shared/button.dart';

class settingsController extends GetxController {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  User? user;
  bool loding = true;
  settingsController() {
    getUserProfile();
  }
  getUserProfile() async {
    loding = true;
    try {
      await ApiServices()
          .getRequestMap(
        url: apiConst.userByID,
      )
          .then((value) {
        if (value.isNotEmpty && value['error'] == null) {
          user = User.fromJson(value['user']);
          name.text = user!.name.toString();
          email.text = user!.email.toString();

          update();
          loding = false;
          return;
        }
        AppHelper.errorsnackbar(value['error']);
      });
    } catch (e) {
      AppHelper.errorsnackbar(e);
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
