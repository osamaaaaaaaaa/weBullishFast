import 'package:get/get.dart';

import '../Models/FaqModel.dart';
import '../Models/TopNotificationModel.dart';
import '../Services/apiServices.dart';

class FaqController extends GetxController {
  bool faqsLoading = true;
  List<FaqModel> faqs = [];
  FaqController() {
    getTeam();
  }

  getTeam() async {
    faqs.clear();
    faqsLoading = true;
    update();

    await ApiServices().getRequestList(url: 'api/faq/show_all').then((value) {
      print(value);
      if (value.isNotEmpty && value[0]['error'] != null) {
        //  AppHelper.errorsnackbar("Teams:${value[0]['error']}");

        return;
      }
      for (var e in value) {
        faqs.add(FaqModel.fromJson(e));

        update();
      }
      update();
    });
    faqsLoading = false;
    update();
  }
}
