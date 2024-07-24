import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class Startcoursevideos extends StatefulWidget {
  const Startcoursevideos({super.key});

  @override
  State<Startcoursevideos> createState() => _StartcoursevideosState();
}

class _StartcoursevideosState extends State<Startcoursevideos> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 310.h,
            color: Colors.black,
            child: FlickVideoPlayer(
              flickManager: flickManager,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, position) {
                return Container(
                  height: 100.h,
                  child: Row(
                    children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: Image.asset("assets/googlelogo.png"),
                     ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text("hghcghbvkhb")
                    ],
                  ),
                );
              },
              separatorBuilder: (context, position) {
                return Divider();
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
