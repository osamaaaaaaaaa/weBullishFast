import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish_fast/View/Ui/Auth/privacy.dart';
import 'package:webullish_fast/View/Ui/Auth/terms.dart';
import '../../../Controller/AuthController.dart';
import '../../../Helper/AppColors.dart';
import '../../../Helper/AppImages.dart';
import '../../../Models/CountriesModel.dart';
import '../../Shared/TextFieldWidget.dart';
import '../../Shared/button.dart';
import 'LogIn.dart';

class register extends StatelessWidget {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.color1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(AppImages.webullishLogo),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Register now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFieldWidget(
                  controller: name,
                  title: 'your name',
                  iconData: Icons.person,
                  IsPass: false),
              TextFieldWidget(
                  controller: email,
                  title: 'youremail@mail.com',
                  iconData: Icons.email,
                  IsPass: false),
              TextFieldWidget(
                  controller: password,
                  title: 'password',
                  iconData: Icons.lock,
                  IsPass: true),
              Container(
                margin: EdgeInsets.all(13),
                child: _country(
                    controller: controller,
                    width: MediaQuery.of(context).size.width),
              ),
              Container(
                margin: EdgeInsets.all(13),
                child: _city(
                    controller: controller,
                    width: MediaQuery.of(context).size.width),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  if (name.text.isEmpty ||
                      email.text.isEmpty ||
                      password.text.isEmpty) {
                    return;
                  }
                  controller.signup(
                      name: name.text,
                      email: email.text.trim(),
                      password: password.text.trim());
                },
                child: button(
                    color: AppColors.gold,
                    title: 'Sign Up',
                    fontsize: 22,
                    fontColor: Colors.white,
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.93),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'If you have an account? ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(() => Login());
                    },
                    child: Text(
                      'Sign In here',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(2),
                child: const Text(
                  'By clicking Sing up, you agree to our',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.off(() => terms());
                    },
                    child: Text(
                      'Terms',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    ' and ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(() => privacy());
                    },
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
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

Widget _country({required AuthController controller, required width}) =>
    DropdownButtonHideUnderline(
      child: DropdownButton2<CountriesModel>(
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              Icons.list,
              size: 16,
              color: AppColors.gold,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                controller.country.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: controller.countriesList
            .map((CountriesModel item) => DropdownMenuItem<CountriesModel>(
                  value: item,
                  child: Text(
                    item.name.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        //  value: controller.country,
        onChanged: (value) {
          controller.citiesList = value!.cities!;
          controller.country = value.name.toString();
          controller.countryId = value.id;
          controller.update();

          print(value?.name.toString());
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: width,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: AppColors.grey,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.redAccent,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
Widget _city({
  required AuthController controller,
  required width,
}) =>
    DropdownButtonHideUnderline(
      child: DropdownButton2<Cities>(
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              Icons.list,
              size: 16,
              color: AppColors.gold,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                controller.city.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: controller.citiesList
            .map((Cities item) => DropdownMenuItem<Cities>(
                  value: item,
                  child: Text(
                    item.name.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        //  value: controller.country,
        onChanged: (value) {
          controller.cityId = value?.id;
          controller.city = value!.name.toString();
          controller.update();
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: width,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: AppColors.grey,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.redAccent,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
