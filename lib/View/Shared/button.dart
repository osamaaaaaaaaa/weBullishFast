import 'package:flutter/material.dart';

Widget button(
        {required Color color,
        required String title,
        required double fontsize,
        required Color fontColor,
        required double height,
        required double width}) =>
    Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: TextStyle(
            color: fontColor, fontSize: fontsize, fontWeight: FontWeight.bold),
      ),
    );
