import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/AppColors.dart';
import 'Auth/LogIn.dart';

class PageOnBorarding extends StatelessWidget {
  const PageOnBorarding({Key? key}) : super(key: key);
  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1,
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'What is Webullish',
            body:
                'Webullish.com is an online service that aims to study & identify bullish stock movements / technical breakouts in the stock market (NASDAQ& NYSE).',
            image: Image.asset('assets/images/1.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Who are We ?',
            body:
                'We are full time stock traders & technical analysts from the SW Suburbs of Chicago!  We absolutely love swing trading, but never make it look easy.',
            image: Image.asset('assets/images/2.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Why webullish !',
            body:
                'Easy To Follow: Our Stock alerts are formulated in such a way that traders from all backgrounds can use them for their own trading. Even for Option traders.',
            image: Image.asset('assets/images/3.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Spotting Bullish Trends !',
            body:
                'webullish has the best chart reading expert/s in the field. We have developed a unique chart reading strategy to pinpoint “breakout & breakdown” areas.',
            image: Image.asset('assets/images/4.png'),
            footer: ElevatedButton(
              onPressed: () {
                _storeOnboardInfo();
                Get.to(() => Login());
              },
              child: const Text('start quickly !'),
            ),
          )
        ],
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
        onDone: () {
          _storeOnboardInfo();
          Get.to(() => Login());
        },
        showSkipButton: true,
        skip: const Text('Skip'),
        // onSkip: () => print('skip'),
        // showBackButton: true,
        // back: const Icon(Icons.arrow_back),
        dotsDecorator: getDotDecoration(),
        nextFlex: 0,
        skipOrBackFlex: 0,
        animationDuration: 500,
        isProgressTap: true,
        isProgress: true,
        // freeze: false,
        //onChange: (index) => print(index),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.gold),
      bodyTextStyle: TextStyle(fontSize: 18, color: Colors.white),
      imagePadding: EdgeInsets.all(24),
      titlePadding: EdgeInsets.zero,
      bodyPadding: EdgeInsets.all(20),
      pageColor: AppColors.color1,
    );
  }

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
        color: const Color(0xFFBDBDBD),
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeColor: Colors.orange,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  }
}
