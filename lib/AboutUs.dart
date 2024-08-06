import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          SizedBox(width: 500.w,height:500.h,
              child: Padding(
                padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                child: Text(
                    "LearnApp is a versatile educational platform offering a wide array of courses across various subjects. From programming and data science to creative writing and personal development, LearnApp provides high-quality content tailored to different learning styles. Users can access interactive lessons, practical exercises, and expert guidance to enhance their skills. With features like progress tracking and community support, LearnApp aims to make learning accessible, engaging, and effective for everyone."),
              )),
        ],
      ),
    );
  }
}
