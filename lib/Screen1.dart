import 'package:ecommerce/Signin.dart';
import 'package:ecommerce/Slider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: SizedBox(
                  width: 520.w,
                  height: 600.h,
                  child: Image.asset("assets/phone.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90, left: 30),
                child: SizedBox(
                    width: 350.w,
                    height: 350.h,
                    child: Image.asset("assets/bordercircle.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 460),
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(180 / 360),
                  child: ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: Colors.white,
                      height: 300.0,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 488),
                child: Container(
                  width: double.infinity,
                  height: 360.h,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 65),
                        child: Row(
                          children: [
                            Text(
                              "Finding the",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(width: 13.w),
                            Text(
                              "Perfect",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFA800),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 39),
                        child: Row(
                          children: [
                            Text(
                              "Online Course",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFA800),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              ' for You',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color(0xFF242424),
                                  fontSize: 26.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'App to search and discover the most suitable place for you to stay.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF797979),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SliderPage()));
                        },
                        child: Container(
                          width: 300.w,
                          height: 60.h,
                          decoration: ShapeDecoration(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 27),
                            child: Text(
                              'Let’s Get Started',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70, left: 50),
                        child: Row(
                          children: [
                            Text(
                              'Already have an account? ',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Color(0xFF242424),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Signin()));
                              },
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Color(0xFF0961F5),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    height: 0.09,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();

    path.lineTo(0, h);

    path.quadraticBezierTo(w * 0.5, h - 50, w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
