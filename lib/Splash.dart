import 'package:ecommerce/Bottomnavigation.dart';
import 'package:ecommerce/Home.dart';
import 'package:ecommerce/Onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async{
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey("Token")){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>Bottomnavigation()),(route)=>false);
      }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>Onboard()),(route) => false);
      }

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 340),
                  child: SizedBox(
                    width: 200.w,
                    height: 200.h,
                    child: Image.asset("assets/splash.png"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 372,left: 50),
            child: SizedBox(width: 80.w,height: 80.h,child: Image.asset("assets/splash2.png")),
          ),
        ],
      ),
    );
  }
}
