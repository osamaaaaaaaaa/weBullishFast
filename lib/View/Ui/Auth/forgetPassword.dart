import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/AuthController.dart';
import '../../../Helper/AppColors.dart';
import '../../../Helper/AppImages.dart';
import '../../Shared/TextFieldWidget.dart';
import '../../Shared/TopAppBar.dart';
import '../../Shared/button.dart';

class ForgetPassword extends StatelessWidget {
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.color1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TopAppBar(title: 'Forgot Password'),
              SizedBox(
                height: 50,
              ),
              Image.asset(AppImages.webullishLogo),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFieldWidget(
                  controller: email,
                  title: 'youremail@mail.com',
                  iconData: Icons.email,
                  IsPass: false),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  if (email.text.isEmpty) {
                    return;
                  }
                  //controller.forgetPass(email.text);
                },
                child: button(
                    color: AppColors.gold,
                    title: 'Forgot Password',
                    fontsize: 20,
                    fontColor: Colors.white,
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.93),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
