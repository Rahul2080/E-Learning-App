import 'package:ecommerce/ResetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SafeArea(
              child: Text(
                'Reset Password',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Email',
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Color(0xFF858383),
                  fontSize: 15.sp,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 60),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Resetpassword()));
              },
              child: Container(
                width: 316.w,
                height: 57.h,
                padding: const EdgeInsets.symmetric(vertical: 17),
                decoration: ShapeDecoration(
                  color: Color(0xD3F8C657),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: Text(
                    'SUBMIT',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
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
