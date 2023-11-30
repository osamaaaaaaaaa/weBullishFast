import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webullish_fast/Helper/AppColors.dart';

class whywebullish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _widget(Icons.all_out, 'Easy To Follow',
            '''Our stock alerts are formatted in such a way that both new and experienced stock traders can greatly benefit from our research. Option traders also stand to benefit from our streamlined analyses.'''),
        _widget(Icons.assistant_outlined, 'Honest Analysis',
            '''We strive to be as transparent as possible with our findings, bringing you the most honest approach to trending stock movements. Every stock alert that we post is based upon in-depth research, and we would never inform anyone of a stock that we have not tirelessly looked into ourselves.'''),
        _widget(Icons.currency_bitcoin, 'Overall Accuracy',
            '''When trading, accuracy is crucial. Our alerts are only posted after we have had the chance to perform rigorous technical analyses and develop charts that offer helpful breakdowns of chosen stocks.'''),
        _widget(Icons.blur_linear_outlined, 'Reliability',
            '''Prior to releasing any information, each alert is verified for authenticity by our group of experts, ensuring that no information is too hastily published and can be trusted without a shadow of a doubt.'''),
        _widget(Icons.attach_money_outlined, 'Rapid Updates',
            '''Our experts are working around the clock to deliver stock alerts as quickly as possible. The quality of a stock can change at a moment’s notice, which is why being swift in providing our members with updates is of the utmost importance.'''),
        _widget(Icons.attractions, 'Unbeatable Value',
            '''Averaging over 100 well-researched stock alerts per month, members of mbullish.com are only tasked with paying a sum that breaks down to \$1 a day. You would be hard-pressed to find such a profitable deal anywhere else!'''),
      ],
    );
  }
}

Widget _widget(IconData icon, title, substitle) => Container(
      width: Get.width,
      // height: 310,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.gold)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(
                color: AppColors.gold,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              substitle,
              style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
