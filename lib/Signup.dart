import 'package:ecommerce/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Signin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SafeArea(
              child: Text(
                'Sign Up',
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
          SizedBox(height: 50.h),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Full Name',
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
                hintText: "Enter Name",
                hintStyle: TextStyle(
                  color: Color(0xFF858383),
                  fontSize: 15.sp,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
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
          SizedBox(height: 20.h),
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
            child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Home()));},
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
                    'LOGIN',
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
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                  width: 130.w,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  )),
              SizedBox(width: 5.w),
              Text(
                'Or Sign In With',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              SizedBox(
                  width: 130.w,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, top: 30),
            child: Row(
              children: [
                Container(
                  width: 82.w,
                  height: 48.h,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDDDDDD)),
                      borderRadius: BorderRadius.circular(10),

                    ),
                  ),
                  child: Icon(
                    Icons.call,
                    color: Colors.blueGrey,
                    size: 30.sp,
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  width: 82.w,
                  height: 48.h,
                  padding: const EdgeInsets.all(15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDDDDDD)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    "assets/googlelogo.png",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70,top: 50),
            child: Row(
              children: [
                Text(
                  'Don’t have an account? ',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'Login Here',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Color(0xFFF8C657),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),);
  }
}
