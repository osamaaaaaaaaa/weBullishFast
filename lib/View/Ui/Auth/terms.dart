import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Helper/AppColors.dart';

class terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.white),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text('Terms', style: TextStyle(color: Colors.white)),
      // ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
            ),
            Container(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 20,
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Text(
                  '''TERMS & CONDITIONS
      Read The Following
      - Any Content On(Or Sent On Behalf) Webullish.Com Should Not Be Taken As A Professional Financial Advice, Or Construed As Providing Financial Guidance For Trading Securities. - Webullish.Com Or Any Of It's Associates Will Never Tell You To Buy, Hold, Or Sell A Certain Security. It Is Your Responsibility To Study, Confirm, And Decide What Is Best For Your Own Investments. - It Is Your Responsibility To Determine When To Enter, And When To Exit Each Trade. Webullish.Com And It's Associates Are Not Responsible For Your Own Entry, And Exit Points. - Webullish.Com Or Any Of It’s Associates Is Not Responsible For Your Trading Choices. -The Information Shared In The Swing Trading Alerts Including Entry Points & Price Targets Should Never Be Used As "Buy" Or "Sell" Signals. That Information Is Relayed ONLY To Pinpoint Certain Areas On The Trading Charts, Thus, Should Be Used As "Buy" Or "Sell" Signals.
      
      Webullish.Com Or Any Of It’s Associates Is Not Responsible For Any Losses Incurred As A Result Of Using Our Alerts. Information Provided In This Correspondence Is Intended Solely For Informational Purposes, And Is Obtained From Various Sources That Are Believed To Be Credible. Information Is In No Way Guaranteed To Be Accurate. Webullish.Com Members Must Do Their Own Due Diligence, And Execute Trades At Their Own Risk At All Times. ''',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
