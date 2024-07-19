import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Home.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

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
              padding: const EdgeInsets.only(top: 300),
              child: OtpTextField(
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode)
    async {
    final credentials = PhoneAuthProvider.credential(
    verificationId: widget.verification,
    smsCode: verificationCode);
    try{
    await auth.signInWithCredential(credentials);
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Home()));
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
}
