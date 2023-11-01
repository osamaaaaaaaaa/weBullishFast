import 'package:flutter/material.dart';
import 'package:webullish_fast/Helper/AppColors.dart';

Widget acheviment({required title, required date}) => Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      height: 180,
      width: 250,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gold),
          borderRadius: BorderRadius.circular(15),
          color: AppColors.grey),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.gold, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
