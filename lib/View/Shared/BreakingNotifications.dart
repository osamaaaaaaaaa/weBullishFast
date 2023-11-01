import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';

class BreakingNotifications extends StatelessWidget {
  final bool isLoading;
  final String data;
  final int dataCount;

  const BreakingNotifications(
      {Key? key,
      required this.isLoading,
      required this.data,
      required this.dataCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: 200,
        child: const Center(
          child: CupertinoActivityIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    if (data.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
            color: Color(0xff1400FF),
          ),
          child: MarqueeText(
            alwaysScroll: true,
            text: TextSpan(text: data, children: []),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            speed: dataCount * 3,
          ),
        )
      ],
    );
  }
}
