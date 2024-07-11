import 'package:ecommerce/Screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Screen1()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 340),
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Image.asset("assets/splash.png"),
              ),
            ),
          ),
          Text(
            'E-Learn',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: Color(0xFF242424),
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
