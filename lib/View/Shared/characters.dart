// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

import 'charachterswidgets.dart';

class characters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despicable Me Characters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
      ),
      home: CharacterListingScreen(),
    );
  }
}

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Container(
            //   margin: EdgeInsets.all(20),
            //   height: 60,
            //   child: RichText(
            //     text: TextSpan(
            //       children: const [
            //         TextSpan(
            //           text: "HOW ARE WE ?",
            //           style: AppTheme.display1,
            //         ),
            //         TextSpan(text: "\n"),
            //       ],
            //     ),
            //   ),
            // ),
            CharacterWidget(),
            SizedBox(
              height: 20,
            ),
          ]),
    );
  }
}
