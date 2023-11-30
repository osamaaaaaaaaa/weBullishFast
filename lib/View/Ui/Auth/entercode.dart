import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/AuthController.dart';
import '../../../Helper/AppColors.dart';
import '../../../Helper/AppImages.dart';
import '../../Shared/TextFieldWidget.dart';
import '../../Shared/TopAppBar.dart';
import '../../Shared/button.dart';

class entercode extends StatelessWidget {
  var code = TextEditingController();
  var pass = TextEditingController();
  var repass = TextEditingController();

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
              Image.asset(AppImages.mbullishLogo),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Enter Code',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFieldWidget(
                  controller: code,
                  title: 'Enter Code',
                  iconData: Icons.numbers,
                  IsPass: false),
              TextFieldWidget(
                  controller: pass,
                  title: 'Enter password',
                  iconData: Icons.numbers,
                  IsPass: false),
              TextFieldWidget(
                  controller: repass,
                  title: 'Reenter password',
                  iconData: Icons.numbers,
                  IsPass: false),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  if (code.text.isEmpty ||
                      pass.text.isEmpty ||
                      repass.text.isEmpty) {
                    return;
                  }
                  // controller.resetPassword(
                  //     code: code.text, pass: pass.text, repass: repass.text);
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
