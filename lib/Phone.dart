import 'package:ecommerce/Otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController phone = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 15.w, right: 25.w, top: 300.h),
              child: TextField(keyboardType:TextInputType.number,
                controller: phone,
                decoration: InputDecoration(prefix: Text("+91 "),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.r),
                      borderSide: BorderSide(width: 2.w, color: Colors.black)),
                  hintText: "Phone Number",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.r),
                      borderSide: BorderSide(width: 2.w, color: Colors.black)),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () {
                print("+91${phone.text}");
                auth.verifyPhoneNumber(

                    phoneNumber:"+91${phone.text}",
                    verificationCompleted: (_){},
                    verificationFailed: (error){ Fluttertoast.showToast(
                        msg: error.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0.sp);},
                    codeSent: (String verificationId,int? token){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Otp(verification: verificationId,)));
                    },
                    codeAutoRetrievalTimeout: (error){ Fluttertoast.showToast(
                        msg: error.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0.sp);});

              },
              child: Container(
                width: 200.w,
                height: 65.h,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 12.h),
                  child: Text(
                    "Send OTP",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
