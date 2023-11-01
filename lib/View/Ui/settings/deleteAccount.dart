// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../Controller/SettingsController.dart';
import '../../../Helper/AppColors.dart';
import '../../Shared/button.dart';

class deleteAcc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<settingsController>(
      init: settingsController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.color1,
        ),
        backgroundColor: AppColors.color1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Would you like to delete youraccount whit us!\nAll data and subscriptions about account will delete!              ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'In the event that request deletion of your account, you will not be able to request the recovery of your account with us ',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'YOU agree to that!',
                  style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.deleteacc();
                },
                child: button(
                    color: AppColors.gold,
                    title: 'Yes, delete it !',
                    fontsize: 18,
                    fontColor: Colors.red,
                    height: 50,
                    width: 250),
              )
            ],
          ),
        ),
      ),
    );
  }
}
