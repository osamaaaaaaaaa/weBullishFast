// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_box/video_box.dart';

class OneVideoCtrl extends StatefulWidget {
  late String name, url;
  OneVideoCtrl({
    required this.name,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  createState() => _OneVideoCtrlState(name: name, url: url);
}

class _OneVideoCtrlState extends State<OneVideoCtrl> {
  late String name, url;
  _OneVideoCtrlState({
    required this.name,
    required this.url,
  });
  late VideoController vc;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    vc = VideoController(
      source: VideoPlayerController.network(url),
      autoplay: true,
    )
      ..initialize().then((e) {
        // ignore: avoid_print
        print(e);
        // if (e != null) {
        //   print('[video box init] error: ' + e.message);
        // } else {
        //   print('[video box init] success');
        // }
      })
      ..addListener(() {
        if (vc.videoCtrl.value.isBuffering) {
          // ignore: avoid_print
          print('==============================');
          // ignore: avoid_print
          print('isBuffering');
          // ignore: avoid_print
          print('==============================');
        }
      });
  }

  @override
  void dispose() {
    vc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoBox(
            controller: vc,
            children: <Widget>[
              VideoBar(
                vc: vc,
                name: name,
              ),
              // Align(
              //   alignment: const Alignment(0.5, 0),
              //   child: IconButton(
              //     iconSize: VideoBox.centerIconSize,
              //     disabledColor: Colors.white60,
              //     icon: const Icon(Icons.skip_next),
              //     onPressed: () {},
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // body: ListView(
      //   controller: controller,
      //   children: <Widget>[

      // Wrap(
      //   alignment: WrapAlignment.spaceBetween,
      //   children: <Widget>[
      //     ElevatedButton(
      //       child: const Text('play'),
      //       onPressed: () {
      //         vc.play();
      //       },
      //     ),
      //     ElevatedButton(
      //       child: const Text('pause'),
      //       onPressed: () {
      //         vc.pause();
      //       },
      //     ),
      //     ElevatedButton(
      //       child: const Text('full screen'),
      //       onPressed: () => vc.onFullScreenSwitch(context),
      //     ),
      //     ElevatedButton(
      //       child: const Text('print'),
      //       onPressed: () {
      //         // ignore: avoid_print
      //         print(vc);
      //         // ignore: avoid_print
      //         print(vc.value);
      //       },
      //     ),
      //   ],
      // ),
      // ],
      // ),
    );
  }
}

class VideoBar extends StatelessWidget {
  final VideoController vc;
  final List<double> speeds;
  final String? name;
  const VideoBar({
    Key? key,
    this.name,
    required this.vc,
    this.speeds = const [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0],
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('$name'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.slow_motion_video),
                        title: const Text('play speed'),
                        onTap: () {
                          showModalBottomSheet<double>(
                            context: context,
                            builder: (context) {
                              return ListView(
                                children: speeds
                                    .map((e) => ListTile(
                                          title: Text(e.toString()),
                                          onTap: () =>
                                              Navigator.of(context).pop(e),
                                        ))
                                    .toList(),
                              );
                            },
                          ).then((value) {
                            if (value != null) vc.setPlaybackSpeed(value);
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
