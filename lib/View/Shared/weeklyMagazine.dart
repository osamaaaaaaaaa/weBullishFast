// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webullish_fast/Helper/AppColors.dart';

Widget weeklyMagazine({required image, required title}) => Container(
      margin: EdgeInsets.all(5),
      width: 250,
      child: Stack(children: [
        image == null
            ? Icon(Icons.no_photography)
            : ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 250,
                  child: Image.network(
                    image,
                    width: 250,
                    height: 150,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      );
                    },
                  ),
                )),
        Positioned(
            bottom: 5,
            right: 10,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.color2),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Reade now',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ))
      ]),
    );
