import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class Startcoursevideos extends StatefulWidget {
  final List<dynamic> Videolist;

  const Startcoursevideos({
    super.key,
    required this.Videolist,
  });

  @override
  State<Startcoursevideos> createState() => _StartcoursevideosState();
}

class _StartcoursevideosState extends State<Startcoursevideos> {
  late VideoPlayerController videoController;
  ChewieController? chewieController;

  int currentindex = 0;

  initializePlay(String videoPath) {
    videoController = VideoPlayerController.networkUrl(Uri.parse(videoPath))
      ..initialize().then((_) {
        setState(() {
          chewieController = ChewieController(
              videoPlayerController: videoController,
              aspectRatio: videoController.value.aspectRatio,
              looping: false,
              autoPlay: true);
        });
      });
  }

  Changevideo(String videoPath, int index) {
    setState(() {
      currentindex = index;
    });
    videoController.pause();
    videoController.dispose();
    chewieController?.dispose();
    initializePlay(videoPath);
  }

  @override
  void initState() {
    super.initState();
    initializePlay(widget.Videolist[currentindex]["url"]);
  }

  @override
  void dispose() {
    videoController?.dispose();
    chewieController?.dispose();
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
            child: chewieController == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Chewie(
                    controller: chewieController!,
                  ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.Videolist.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                  onTap: () {
                    Changevideo(widget.Videolist[position]['url'], position);
                  },
                  child: Container(
                    height: 100.h,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Stack(
                            children:[ Container(
                              width: 150.w,
                              height: 100.h,
                              color: Colors.white30,
                              child: Image.network(
                                  widget.Videolist[position]["img"].toString(),fit: BoxFit.cover,),
                            ),
                              Padding(
                                padding:  EdgeInsets.only(left: 45.w),
                                child: Center(child: Icon(Icons.slow_motion_video_sharp,size: 50.sp,color: Colors.white,)),
                              )
                          ],),
                        ),
                        SizedBox(
                          width: 15.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 28.h),
                              child: Text(widget.Videolist[position]["tittle"]
                                  .toString()),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                                "${widget.Videolist[position]["duration"].toString()} min"),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, position) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}
