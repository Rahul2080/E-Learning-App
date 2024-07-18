import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'Signin.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

final introKey = GlobalKey<IntroductionScreenState>();

class _OnboardState extends State<Onboard> {
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Signin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      autoScrollDuration: 3000,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60.h,
      ),
      pages: [
        PageViewModel(
          title:  'Certification and Badges',
          body:
          'Earn a certificate after completion of            every course',
          image: Image.asset('assets/sliderimg1.png'),
        ),
        PageViewModel(
          title: " 'Progress Tracking",
          body:
          'Check your Progress of every course',
          image: Image.asset('assets/sliderimg2.png'),
        ),
        PageViewModel(
          title: "Offline Access",
          body:
              "Make your course available offline",
          image: Image.asset('assets/sliderimg3.png'),
        ),
        PageViewModel(
          title: "Course Catalog",
          body:
              "View in which courses you are enrolled",
          image: Image.asset('assets/sliderimg4.png'),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600),),
      next: CircleAvatar(
        radius: 30.r,
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Color(0x3F0F7BA34),
      ),
      done: Container(
          width: 80.w,
          height: 40.h,
          decoration: ShapeDecoration(color:Color(0x3F0F7BA34),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child:  Padding(
            padding: const EdgeInsets.only(top: 3,left: 15),
            child: Text('Done',
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.sp)),
          ),),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
