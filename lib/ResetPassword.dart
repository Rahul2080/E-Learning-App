import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Signin.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
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
            ),SizedBox(height: 150.h),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Password',
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
                obscureText: isVisible,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter password",
                    hintStyle: TextStyle(
                      color: Color(0xFF858383),
                      fontSize: 15.sp,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    suffix: InkWell(
                      child: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    )),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Confirm Password',
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
                obscureText: isVisible,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Confirm password",
                    hintStyle: TextStyle(
                      color: Color(0xFF858383),
                      fontSize: 15.sp,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    suffix: InkWell(
                      child: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 60),
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
          ],
        ),
      ),
    );
  }
}
