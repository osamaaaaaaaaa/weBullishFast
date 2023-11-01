// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish_fast/Controller/AuthController.dart';
import 'package:webullish_fast/Helper/AppColors.dart';
import 'package:webullish_fast/Helper/AppImages.dart';
import 'package:webullish_fast/View/Ui/Auth/register.dart';
import '../../Shared/TextFieldWidget.dart';
import '../../Shared/button.dart';

class Login extends StatelessWidget {
  var email = TextEditingController();
  var pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.color1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(AppImages.webullishLogo),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'LogIn today',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFieldWidget(
                  controller: email,
                  title: 'Email@mail.com',
                  iconData: Icons.email,
                  IsPass: false),
              TextFieldWidget(
                  controller: pass,
                  title: 'Password',
                  iconData: Icons.lock,
                  IsPass: true),
              InkWell(
                onTap: () {
                  //   Get.to(() => ForgetPassword());
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.log_in(
                      Email: email.text.trim(), Pass: pass.text.trim());
                },
                child: button(
                    color: AppColors.gold,
                    title: 'Login',
                    fontsize: 22,
                    fontColor: Colors.white,
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.93),
              ),
              InkWell(
                onTap: () async {
                  controller.log_in(Email: 'guest@guest.com', Pass: '12345678');
                },
                child: button(
                    color: AppColors.gold,
                    title: 'Login as Guest',
                    fontsize: 22,
                    fontColor: AppColors.color2,
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.93),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Didn’t have any account? ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => register());
                    },
                    child: Text(
                      'Sign Up here',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
