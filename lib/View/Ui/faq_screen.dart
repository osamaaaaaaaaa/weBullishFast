import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/faq_controller.dart';
import '../../Helper/AppColors.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaqController>(
      init: FaqController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.color1,
          automaticallyImplyLeading: false,
          title: Text('Faq'),
        ),
        backgroundColor: AppColors.color1,
        body: SafeArea(
          child: GetBuilder<FaqController>(
              init: FaqController(),
              builder: (context) {
                if (controller.faqsLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }

                if (controller.faqs.isEmpty) {
                  return Center(
                    child: Text(
                      'There is no faqs',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      //   Text('FAQ',style: TextStyle(
                      // color: Colors.white,
                      // fontSize: 18,
                      // fontWeight: FontWeight.bold
                      //   ),),
                      ListView.separated(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return Material(
                              color: AppColors.gold,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ExpansionTile(
                                  backgroundColor: AppColors.gold,
                                  collapsedIconColor: Colors.blue,
                                  iconColor: Colors.blue,
                                  collapsedBackgroundColor: AppColors.gold,
                                  collapsedTextColor: Colors.white,
                                  textColor: Colors.white,
                                  title: Text(
                                      controller.faqs[index].question ?? ''),
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                          controller.faqs[index].answer ?? ''),
                                      textColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, __) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: controller.faqs.length),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
