import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:webullish_fast/Controller/AlertsController.dart';
import 'package:webullish_fast/Services/ApiConst.dart';

import '../Helper/AppHelper.dart';
import '../Models/UserModel.dart';
import '../Services/apiServices.dart';
import '../View/Shared/bottomNavBar.dart';

class subscribeController extends GetxController {
  User? user;
  subscribeController() {
    getUserProfile();
    getToken();
  }

  getUserProfile() async {
    try {
      await ApiServices()
          .getRequestMap(
        url: apiConst.userByID,
      )
          .then((value) {
        if (value.isNotEmpty && value['error'] != null) {
          AppHelper.errorsnackbar("user:${value['error']}");

          return;
        }

        user = User.fromJson(value['user']);

        update();
      });
    } catch (e) {
      print(e);
    }
  }

  String? token;
  getToken() {
    FirebaseMessaging.instance.getToken().then((value) {
      token = value;
      update();
    });
  }

  Future<void> initPaymentSheet(context,
      {required int amount, required String planId}) async {
    // if (user == null) {
    //   Get.to(() => register());
    //   return;
    // }
    try {
      // 1. create payment intent on the server
      final response = await http.post(
          Uri.parse(
              'https://us-central1-webullish-14c86.cloudfunctions.net/stripePaymentIntentRequest'),
          body: {
            'email': user?.email,
            'amount': amount.toString(),
          });

      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse.toString());

      //2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Webullish Subscription',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          style: ThemeMode.light,
          allowsDelayedPaymentMethods: true,
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment completed!')),
      );
      addUserSubscribe(planId);
      print('object');
    } catch (e) {
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  addUserSubscribe(planid) async {
    alertsController ctr = Get.put(alertsController());
    try {
      ApiServices().postRequestMap(
        url: 'api/plan/checkoutPlan',
        body: {'plan_id': planid},
      ).then((value) {
        if (value['error'] == null) {
          FirebaseMessaging.instance.subscribeToTopic('topic');
          AppHelper.succssessnackbar('Succssess');
          Get.off(() => bottomNavBar());
          storeToken();
          ctr.isSubscribe();

          return;
        } else {
          AppHelper.errorsnackbar(value['error'].toString());
        }
      });
    } catch (e) {
      print(e);
    }
  }

  storeToken() async {
    await ApiServices().postRequestMap(url: 'api/storeToken', body: {
      'device': Platform.isAndroid ? 'android' : 'ios',
      'device_token': token,
    }).then((value) {
      Get.defaultDialog(content: SelectableText(token.toString()));
    });
  }

  PayPalPay({required double amount, required String planId}) {
    Get.to(UsePaypal(
        sandboxMode: false,
        clientId:
            "AYmoHcZN7xSbH2I8fOjJUp_OfZNAWpvbHs-3COCWsEdx0NA-WfhV67HeWfSxtO-qqu6QV7RjZuFOQmZC",
        secretKey:
            "EGqjozHFNxNJbXksh3pNLdZx7D6DX1aXR-pph5_I0X4IGfSqieXywoZDVN67A6z3Lk7E0qBczMulMnj-",
        returnURL: "https://samplesite.com/return",
        cancelURL: "https://samplesite.com/cancel",
        transactions: [
          {
            "amount": {
              "total": '${amount}',
              "currency": "USD",
              "details": {
                "subtotal": '${amount}',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": const {
              "items": [
                {
                  "name": "Webullish subscribe",
                  "quantity": 1,
                  "price": '20.00',
                  "currency": "USD"
                }
              ],

              // shipping address is not required though
              "shipping_address": {
                "recipient_name": "webullish",
                "line1": "united states - Irbid",
                "line2": "",
                "city": "Irbid",
                "country_code": "JO",
                "postal_code": "21121",
                "phone": "+962791560467",
              },
            }
          }
        ],
        note: "Contact us for any questions on your subscribe.",
        onSuccess: (Map params) async {
          // controller.addpremuimuser('monthly');
          addUserSubscribe(planId);
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
        },
        onCancel: (params) {
          print('cancelled: $params');
        }));
  }
}
