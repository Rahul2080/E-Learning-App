import 'package:ecommerce/StartCourseVideos.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final String videopassing;
  final String coursename;
  final String aboutcourse;
 final List<dynamic>? studentcoursemarketing;

  const Video({super.key, required this.videopassing, required this.coursename, required this.aboutcourse,
     this.studentcoursemarketing
  });

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
            widget.videopassing,),
      ),
    );
  }
  @override
  void dispose() {
    flickManager.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 310.h,
              color: Colors.black,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Container(width: 250.w,height: 40.h,
                    child: Text(
                      widget.coursename,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),SizedBox(width: 60.w,),
                  Icon(Icons.save,size: 30.sp,)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Divider(
                color: Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'About Course ',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Color(0xFF1D1B20),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: ReadMoreText(widget.aboutcourse,
                preDataTextStyle: const TextStyle(fontWeight: FontWeight.w700,),
                style: const TextStyle(color: Colors.black),
                colorClickableText: Colors.pink,
                trimCollapsedText: '...Show more',
                trimExpandedText: ' show less',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38,top: 90),
              child: GestureDetector(onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => Startcoursevideos()));
              },
                  child: Container(
                    width: 300.w,
                    height: 65.h,
                    decoration: ShapeDecoration(color: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),child: Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Text(
                      'Start Course!..',textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          color:Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                                  ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
