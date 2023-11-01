// ignore_for_file: camel_case_types, file_names

import 'package:get/get.dart';
import 'package:webullish_fast/Controller/AuthController.dart';
import 'package:webullish_fast/Controller/HomeController.dart';

class binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
  }
}
