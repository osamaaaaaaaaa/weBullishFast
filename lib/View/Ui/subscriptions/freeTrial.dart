import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/subscribeController.dart';
import '../../../Helper/AppColors.dart';
import '../../Shared/TopAppBar.dart';
import '../../Shared/button.dart';
import '../Auth/register.dart';

class freetrial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<subscribeController>(
      init: subscribeController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.color1,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              TopAppBar(title: 'mbullish PRO'),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  'Supercharge Your Stock',
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
                  'With more techy bells n’ mbullish than our free version.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              _titles(free: 'mbullish\n    FREE', pro: 'mbullish\n     PRO'),
              _widget(
                  title: 'Well Researched Alerts',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              _widget(
                  title: 'Simple Format',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              _widget(
                  title: 'Spot-On Stock Alerts',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              _widget(
                  title: 'Accessible Analytics',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              _widget(
                  title: 'Weekly Magazine',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              _widget(
                  title: 'Educational videos',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              _widget(
                  title: 'No Contracts',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              _widget(
                  title: 'No Commitments',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              _widget(
                  title: 'Cancel Anytime',
                  icon1: Icons.check,
                  icon2: Icons.cancel_outlined),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: const Text(
                  'mbullish Pro subscription for 19.99\$/month automatically charged after trial ends. you can cancel anytime',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  controller.getUserProfile();
                  if (controller.user?.name == 'Guest') {
                    Get.to(() => register());
                    return;
                  }
                  controller.addUserSubscribe('plan_Of5tmhfkBZbwIi');
                },
                child: Container(
                  alignment: Alignment.center,
                  child: button(
                      color: AppColors.gold,
                      title: 'Try for free',
                      fontsize: 18,
                      fontColor: Colors.white,
                      height: 50,
                      width: 250),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _widget(
    {required title, required IconData icon2, required IconData icon1}) {
  return Container(
    margin: EdgeInsets.all(10),
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width * 0.4,
          child: Text(
            '- ${title}',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Icon(
            icon2,
            color: AppColors.gold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          child: Icon(
            icon1,
            color: AppColors.gold,
          ),
        ),
      ],
    ),
  );
}

Widget _titles({
  required free,
  required pro,
}) {
  return Container(
    margin: EdgeInsets.all(10),
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width * 0.45,
        ),
        Text(
          '${free}',
          style: TextStyle(
              color: AppColors.gold, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Text(
          '${pro}',
          style: TextStyle(
              color: AppColors.gold, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
