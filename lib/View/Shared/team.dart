import 'package:flutter/widgets.dart';
import 'package:webullish_fast/Helper/AppColors.dart';

Widget teamperson({
  required image,
  required name,
  required desc,
}) =>
    Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              image,
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
                color: AppColors.gold,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Text(
            desc,
            style: TextStyle(
                color: AppColors.gold,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
