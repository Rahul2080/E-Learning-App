import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/ProfileEdit.dart';
import 'package:ecommerce/Signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Cart.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final firestore =
    FirebaseFirestore.instance.collection("Users").snapshots();
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Cart()));},
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30.sp,
                ),
              ),
            )
          ],
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Text(
              'Profile',
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  color: Color(0xFF1D1B20),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60.r,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 70),
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Icon(Icons.image_outlined),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Muhammad Rafey',
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  color: Color(0xFF202244),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              'muhammadrafey999@gmail.com',
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  color: Color(0xFF545454),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 70.h),
            GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Profileedit()));},
              child: Container(
                width: 340.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFC6D6D3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Edit',
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
              SizedBox(width: 256.w),
                    Icon(Icons.double_arrow)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 340.w,
              height: 50.h,
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Setting ',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 226.w),
                  Icon(Icons.double_arrow)
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 340.w,
              height: 50.h,
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Achievements',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 173.w),
                  Icon(Icons.double_arrow)
                ],
              ),
            ), SizedBox(height: 20.h),
            Container(
              width: 340.w,
              height: 50.h,
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'About Us',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 216.w),
                  Icon(Icons.double_arrow)
                ],
              ),
            ), SizedBox(height: 20.h),
            GestureDetector(onTap: () async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (_) => Signin()),(route)=>false);

            },
              child: Container(
                width: 340.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFC6D6D3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Logout',
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 230.w),
                    Icon(Icons.double_arrow)
                  ],
                ),
              ),
            ),


          ],
        ));
  }
}
