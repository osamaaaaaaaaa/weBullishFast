// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../../Helper/AppColors.dart';

//Stateful widget to fetch and then display video content.
class videoimageviww extends StatefulWidget {
  late String link;
  videoimageviww({required this.link});
  @override
  _VideoAppState createState() => _VideoAppState(link: link);
}

class _VideoAppState extends State<videoimageviww> {
  late String link;
  _VideoAppState({required this.link});
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(link)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? Container(
              width: 150,
              height: 150,
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: VideoPlayer(_controller)),
            )
          : Container(
              child: CircularProgressIndicator(
                color: AppColors.gold,
              ),
            ),
    );
    // floatingActionButton:
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class videoimageviww2 extends StatefulWidget {
  late String link;
  videoimageviww2({required this.link});
  @override
  _VideoAppStatee createState() => _VideoAppStatee(link: link);
}

class _VideoAppStatee extends State<videoimageviww2> {
  late String link;
  _VideoAppStatee({required this.link});
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(link)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? Container(
              width: Get.width * 0.2,
              height: Get.width * 0.2,
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: VideoPlayer(_controller)),
            )
          : Container(
              child: CircularProgressIndicator(
                color: AppColors.gold,
              ),
            ),
    );
    // floatingActionButton:
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

Widget videoimageviw({required image}) => Container(
      child: ClipRRect(
          child: Image.network(
        image,
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
      )),
    );
