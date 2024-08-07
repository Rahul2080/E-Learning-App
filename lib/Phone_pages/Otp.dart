import 'package:ecommerce/Bottomnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/Home.dart';

class Otp extends StatefulWidget {
  final String verification;
  const Otp({super.key, required this.verification});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top: 300.h),
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode)
    async {

    final credentials = PhoneAuthProvider.credential(
    verificationId: widget.verification,
    smsCode: verificationCode);
    checkLogin();
    try{
    await auth.signInWithCredential(credentials);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> Bottomnavigation()),(route)=>(false));
    }
    catch(e){
    Fluttertoast.showToast(msg: "Error");
    };
                }, // end onSubmit
              ),
            ),
          ),
        ],
      ),
    );
  }
  void checkLogin()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Token', true);
  }
}
