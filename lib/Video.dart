import 'package:ecommerce/StartCourseVideos.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({super.key});

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
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                Text(
                  'UI/UX Design',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Color(0xFF1D1B20),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),SizedBox(width: 165.w,),
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
            child: Text(
              'jdshfhjasnjhoJCH piujauhdjuyshjs siusjmfk',
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  color: Color(0xFF1D1B20),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38,top: 90),
            child: GestureDetector(onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => Startcoursevideos()));
            },
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
          ),
        ],
      ),
    );
  }
}
