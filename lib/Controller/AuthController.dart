// ignore_for_file: unused_local_variable, prefer_final_fields, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish_fast/Controller/HomeController.dart';
import 'package:webullish_fast/Helper/AppHelper.dart';
import 'package:webullish_fast/Models/UserModel.dart';
import 'package:webullish_fast/Services/ApiConst.dart';
import 'package:webullish_fast/Services/ApiServices.dart';
import 'package:webullish_fast/Services/StorageKey.dart';
import 'package:webullish_fast/View/Shared/bottomNavBar.dart';

import '../Models/CountriesModel.dart';
import '../View/Ui/Auth/LogIn.dart';
import '../View/Ui/Auth/entercode.dart';

class AuthController extends GetxController {
  ApiServices _ApiServices = ApiServices();
  GetStorage _box = GetStorage();
  List<CountriesModel> countriesList = [];
  List<Cities> citiesList = [];
  String country = 'Select Country';
  String city = 'Select City';
  int? countryId;
  int? cityId;
  AuthController() {
    isLogin();

    getCountries();
  }

  isLogin() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getBool(StorageKey.isLogin) == true) {
      if (_prefs.getString(StorageKey.email).toString() == 'guest@guest.com') {
        return;
      }
      log_in(
          Email: _prefs.getString(StorageKey.email).toString(),
          Pass: _prefs.getString(StorageKey.pass).toString());
    } else {}
  }

  log_in({required String Email, required String Pass}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _loading();
    User _user = User(email: Email.trim(), password: Pass.trim());
    await _ApiServices.postRequestMap(url: apiConst.logIn, body: _user.toJson())
        .then((value) {
      if (value["error"] != null) {
        Get.back();
        AppHelper.errorsnackbar(value.toString());

        return;
      } else {
        _box.write(StorageKey.token, value['access_token']);
        _prefs.setString(StorageKey.email, Email);
        _prefs.setString(StorageKey.pass, Pass);
        _prefs.setBool(StorageKey.isLogin, true);

        Get.offAll(() => bottomNavBar());
      }
    });
  }

  signup({required name, required email, required password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _loading();
    User model = User(
        name: name,
        email: email,
        password: password,
        city: city.toString(),
        country: country,
        cityId: cityId,
        countryId: countryId);
    try {
      await _ApiServices.authRequest(
        url: apiConst.signUp,
        credintial: model.toJson(),
      ).then((value) async {
        if (value.isNotEmpty && value['error'] != null) {
          Get.back();
          AppHelper.errorsnackbar("signup:${value['error']}");

          return;
        }
        _box.write(StorageKey.token, value['access_token']);

        _box.write(StorageKey.credintal, {
          "email": email.toString().trim(),
          "password": password.toString().trim()
        });
        prefs.setString(StorageKey.email, email);
        prefs.setString(StorageKey.pass, password);
        prefs.setBool(StorageKey.isLogin, true);

        await prefs.setBool('islogin', true);

        _box.write(StorageKey.userdata, value);
        _box.write(StorageKey.token, value['access_token']);

        HomeController().handleBootmNabBar(0);
        Get.offAll(() => bottomNavBar());

        update();
      });
      update();
    } catch (e) {
      print(e);
    }
  }

  getCountries() async {
    try {
      countriesList.clear();
      await _ApiServices.getRequestMap(url: apiConst.countries).then((value) {
        if (value.isNotEmpty && value['error'] != null) {
          //    AppHelper.errorsnackbar("Countries:${value['error']}");

          return;
        }

        for (var e in value['token_type']) {
          countriesList.add(CountriesModel.fromJson(e));

          update();
        }

        update();
      });
    } catch (e) {
      print(e);
    }
    update();
  }

  _loading() {
    Get.defaultDialog(
        title: 'Loading',
        backgroundColor: Colors.transparent,
        content: Center(
          child: CircularProgressIndicator(),
        ));
  }

  int? code;
  forgetPass(email) async {
    try {
      await _ApiServices.postRequestMap(
          url: 'api/password/email', body: {'email': email}).then((value) {
        print(value);
        if (value['error']['message'].toString() ==
            'User successfully sent code check it') {
          AppHelper.succssessnackbar(value['error']['message'].toString());
          code = value['code'];
          Get.to(() => entercode());
          return;
        }
        AppHelper.errorsnackbar(value['message'].toString());
      });
    } catch (e) {
      print(e);
    }
    update();
  }

  resetPassword({required code, required pass, required repass}) async {
    await _ApiServices.postRequestMap(url: 'api/password/reset', body: {
      'code': code,
      'password': pass,
      'password_confirmation': repass
    }).then((value) {
      print(value);
      if (value['message'] == 'Password reset successfully') {
        AppHelper.succssessnackbar("${value['message']}");
        Get.to(() => Login());
        return;
      }
      code = value['code'];
      AppHelper.errorsnackbar("${value['message']}");
    });
    update();
  }
}
