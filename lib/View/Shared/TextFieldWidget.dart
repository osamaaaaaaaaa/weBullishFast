import 'package:flutter/material.dart';
import 'package:webullish_fast/Helper/AppColors.dart';

Widget TextFieldWidget({
  required TextEditingController controller,
  required String title,
  required IconData iconData,
  required bool IsPass,
}) =>
    Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
      child: TextFormField(
        controller: controller,
        obscureText: IsPass,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            suffixIcon: Icon(
              iconData,
              color: AppColors.gold,
            ),
            label: Text(title, style: const TextStyle(color: Colors.grey)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.gold,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.gold,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.gold,
                width: 2.0,
              ),
            )),
      ),
    );
