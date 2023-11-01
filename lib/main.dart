import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish_fast/Binding/Binding.dart';
import 'package:webullish_fast/View/Ui/Auth/LogIn.dart';

const stripePublishableKey = 'pk_live_hxiKd2gWhLR0sXINKQ5lv8As004zRq5swp';
late FirebaseMessaging messaging;
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // islogIn();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // messaging = FirebaseMessaging.instance;
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  runApp(const app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: binding(),
      home: Login(),
    );
  }
}
