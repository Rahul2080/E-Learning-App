import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_exit/non_web_preview.dart';
import 'package:ecommerce/Ebook.dart';
import 'package:ecommerce/PersonalChat.dart';
import 'package:ecommerce/ProfileEdit.dart';
import 'package:ecommerce/Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    int index=0;
    final firestore =
        FirebaseFirestore.instance.collection("Users").snapshots();
    FirebaseAuth auth=FirebaseAuth.instance;
    return DoubleBackToExitWidget(snackBarMessage: 'Press back again to exit',
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding:  EdgeInsets.only(right: 10.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Cart()));
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30.sp,
                ),
              ),
            )
          ],
          automaticallyImplyLeading: false,
          title: Padding(
            padding:  EdgeInsets.only(left: 150.w),
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
        body: StreamBuilder<QuerySnapshot>(
            stream: firestore,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR"),
                );
              }
              if (snapshot.hasData) {
                for(int i=0;i<snapshot.data!.docs.length;i++){
                 if(snapshot.data!.docs[i]["id"]==auth.currentUser!.uid.toString()) {index=i;}
                }
                return Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 60.r,backgroundImage: NetworkImage(snapshot.data!.docs[index]["profile"].toString()),
                      ),
                    ),
                    Text(
                        snapshot.data!.docs[index]["name"].toString(),
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF202244),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      snapshot.data!.docs[index]["email"],
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF545454),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 70.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Profileedit(index:index ,)));
                      },
                      child: Container(
                        width: 340.w,
                        height: 50.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFFC6D6D3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w),
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
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 20.w),
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
                    GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Personalchat()));},
                      child: Container(
                        width: 340.w,
                        height: 50.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFFC6D6D3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w),
                              child: Text(
                                'Help',
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 255.w),
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
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 20.w),
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
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.clear();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => Signin()),
                            (route) => false);
                      },
                      child: Container(
                        width: 340.w,
                        height: 50.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFFC6D6D3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w),
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
                );
              } else {
                return SizedBox();
              }
            }),
      ),
    );
  }
}
