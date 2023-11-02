import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webullish_fast/Binding/Binding.dart';
import 'package:webullish_fast/View/Ui/Auth/LogIn.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

const stripePublishableKey = 'pk_live_hxiKd2gWhLR0sXINKQ5lv8As004zRq5swp';
late FirebaseMessaging messaging;
bool? islogin;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await FirebaseMessaging.instance.subscribeToTopic("topic");
  messaging = FirebaseMessaging.instance;
  messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    sound: true,
    badge: true,
  );

  await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: true,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  islogin = await prefs.getBool('islogin');

  // islogIn();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // messaging = FirebaseMessaging.instance;
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  runApp(const app());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

forgroundnotifocations() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {}
  });
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
