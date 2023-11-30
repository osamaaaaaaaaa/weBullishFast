import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character(
      {required this.name,
      required this.imagePath,
      required this.description,
      required this.colors});
}

List characters = [
  Character(
      name: "Who are We?",
      imagePath: "assets/images/Kevin_minions.png",
      description:
          "We are full time stock traders & technical analysts from the SW Suburbs of Chicago!  We absolutely love swing trading, but never make it look easy. We understand that stock trading is a challenge, but we are up for the task. Bilal & AJ both come with over 5 years of experience in the stock market with a proven track record. We have a physical office location in Palos Heights, IL. Members, and Non-members are always welcome to visit, and get to know us!",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Character(
      name: "mbullish.com",
      imagePath: "assets/images/Agnes_gru.png",
      description:
          "mbullish.com is an online service dedicated to seeking out and identifying recent bullish stock movements, as well as technical breakouts in both the NASDAQ and NYSE. This information is then conveyed in a matter that allows stock traders of all levels to effortlessly gather vital insight. All resources on mbullish.com are meant for informational purposes only, as we are not financial advisors.",
      colors: [Colors.pink.shade200, Colors.redAccent.shade400]),
  Character(
      name: "Achievement",
      imagePath: "assets/images/a.jpg",
      description:
          "Our team of top tier technology and investment experts are ready to work day and night to create a welcoming atmosphere and expansive access to financial services, equity analysis and maximized personal potential.",
      colors: [
        Color.fromARGB(255, 111, 206, 232),
        Color.fromARGB(255, 25, 59, 114)
      ]),
];
