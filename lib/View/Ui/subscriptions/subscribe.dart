import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/subscribeController.dart';
import '../../../Helper/AppColors.dart';
import '../../Shared/button.dart';
import 'freeTrial.dart';

class subscribe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<subscribeController>(
      init: subscribeController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.color1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Get the golden plan',
                style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          color: Colors.white),
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            hintText: '#Discount Code'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.27,
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            ' activate',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Would you like to get a free subscription period? ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => freetrial());
                    },
                    child: Text(
                      'Press here',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //##################
              //Start of Pro Monthly
              //##################
              Container(
                height: 500,
                width: Get.width,
                margin: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gold),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(160, 35, 11, 52),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Pro Monthly',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$ 19.99',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Swing Trading Alerts',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Well Researched Stock Alerts',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Simple Format For All Stock Traders',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '100+ Spot-On Stock Alerts Every Month',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: AppColors.gold,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            constraints:
                                BoxConstraints(maxWidth: Get.width * 0.7),
                            child: const Text(
                              'Accessible Analytics & Trackable Performance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'No Contracts.No Commitments',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Cancel Anytime',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Text(
                      'Save 40% yearly',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        //############
                        //#Stripe Pay
                        //############
                        InkWell(
                          onTap: () {
                            controller.initPaymentSheet(context,
                                amount: 1999, planId: 'plan_ORj99T19uWqvyU');
                          },
                          child: button(
                              color: AppColors.grey,
                              title: 'credit / debit card',
                              fontsize: 16,
                              fontColor: Colors.white,
                              height: 40,
                              width: 200),
                        ),
                        //#########
                        //Paypal Pay
                        //############
                        InkWell(
                          onTap: () {
                            controller.PayPalPay(
                                amount: 20.00, planId: 'plan_ORj99T19uWqvyU');
                          },
                          child: button(
                              color: AppColors.gold,
                              title: 'Pay with PayPal',
                              fontsize: 16,
                              fontColor: Colors.white,
                              height: 40,
                              width: 200),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //##################
              //End of Pro Monthly
              //##################
              //Start of Pro Yearly
              Container(
                height: 500,
                margin: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gold),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(160, 35, 11, 52),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'ANNUALLY',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$ 140.00',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Save Huge By Making One Single Annual Payment.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '40% Less Than The Monthly Rate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '\$139.99/ Year',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '100+ Spot-On Stock Alerts Every Month',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'A Quick Refund For The Unused Portion',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'No Contracts.No Commitments',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.gold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Cancel Anytime',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Text(
                      'Save 40% yearly',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.initPaymentSheet(context,
                                amount: 13999, planId: 'plan_ORjB5I72YPLFdA');
                          },
                          child: button(
                              color: AppColors.grey,
                              title: 'credit / debit card',
                              fontsize: 16,
                              fontColor: Colors.white,
                              height: 40,
                              width: 200),
                        ),
                        InkWell(
                          onTap: () {
                            controller.PayPalPay(
                                amount: 139.99, planId: 'plan_ORjB5I72YPLFdA');
                          },
                          child: button(
                              color: AppColors.gold,
                              title: 'Pay with PayPal',
                              fontsize: 16,
                              fontColor: Colors.white,
                              height: 40,
                              width: 200),
                        ),
                      ],
                    ),
                  ],
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
