import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_exit/non_web_preview.dart';
import 'package:ecommerce/Home/Cart.dart';
import 'package:ecommerce/Home/Categories.dart';
import 'package:ecommerce/Home/Favourates.dart';
import 'package:ecommerce/Home/Video.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final firestore =
      FirebaseFirestore.instance.collection("Categories").snapshots();
  final StudentCourse =
      FirebaseFirestore.instance.collection("StudentCourse").snapshots();
  final Topcourse =
      FirebaseFirestore.instance.collection("Topcourse").snapshots();
  final Topseller =
  FirebaseFirestore.instance.collection("Topseller").snapshots();
  @override
  Widget build(BuildContext context) {
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
            ),GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Favourates()));},
                child: Icon(Icons.favorite_border,size: 30.sp,))
          ],
          automaticallyImplyLeading: false,
          title: Text(
            'Welcome Khan',
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                color: Color(0xFF1D1B20),
                fontSize: 27.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10.w, top: 20.h),
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Categories()));
                      },
                      child: Text(
                        'See All',
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            color: Color(0xFF1D1B20),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 10.w, top: 10.h),
                child: SizedBox(
                  height: 40.h,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: firestore,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              "ERROR",
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 10.w,
                              );
                            },
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, position) {
                              return Container(
                                decoration: ShapeDecoration(
                                  color: Color(0xFFC6D6D3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(8.0.sp),
                                  child: Text(
                                    snapshot.data!.docs[position]["name"].toString(),
                                    style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return SizedBox();
                        }
                      }),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 10.h, left: 10.w),
                child: Row(
                  children: [
                    Text(
                      'Students Also Search for',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 85.w),
                    Text(
                      'See All',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: StudentCourse,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "ERROR",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 230.h,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, position) {
                            return Padding(
                              padding:  EdgeInsets.only(left: 20.w, right: 10.w),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Video(
                                            videopassing: snapshot
                                                .data!
                                                .docs[position]["videos"],
                                            coursename: snapshot.data!
                                                .docs[position]["courseName"]
                                                .toString(),
                                            aboutcourse: snapshot
                                                .data!.docs[position]["about"]
                                                .toString(),

                                        image: snapshot.data!
                                            .docs[position]["img"]
                                            .toString(), id:  snapshot.data!
                                          .docs[position]["id"]
                                          .toString(), tutter:  snapshot.data!
                                          .docs[position]["tutter"]
                                          .toString(), ratting:  snapshot.data!
                                          .docs[position]["ratting"]
                                          .toString(), price: snapshot.data!
                                          .docs[position]["price"].toString(),
                                          )));
                                },
                                child: Container(
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  width: 180.w,
                                  height: 140.h,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 180.w,
                                          height: 110.h,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                                              child: Image.network(
                                                snapshot.data!.docs[position]
                                                    ["img"],
                                                fit: BoxFit.cover,
                                              ))),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Row(
                                          children: [
                                            Text(
                                              snapshot
                                                  .data!.docs[position]["ratting"]
                                                  .toString(),
                                              style: GoogleFonts.plusJakartaSans(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF1D1B20),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 7.h),
                                            RatingBar.builder(
                                              initialRating: snapshot.data!
                                                  .docs[position]["ratting"],
                                              minRating: 1.sp,
                                              itemSize: 16.sp,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              ignoreGestures: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Color(0xFF477B72),
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10.w, top: 5.h),
                                        child: Text(
                                          snapshot.data!.docs[position]
                                              ["courseName"],
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              color: Color(0xFF1D1B20),
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10.w, top: 5.h),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person_outlined,
                                              size: 20.sp,
                                            ),
                                            Text(
                                              snapshot.data!.docs[position]
                                                  ["tutter"],
                                              style: GoogleFonts.plusJakartaSans(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF060302),
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10.w, top: 5.h),
                                        child: Text(
                                          "\$ ${snapshot.data!.docs[position]['price']}",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              color: Color(0xFF477B72),
                                              fontSize: 13.sp,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, position) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
              Padding(
                padding:  EdgeInsets.only(top: 10.h, left: 10.w),
                child: Row(
                  children: [
                    Text(
                      'Top Courses in IT ',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 150.w),
                    Text(
                      'See All',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 230.h,
                width: double.infinity,
                child: StreamBuilder<QuerySnapshot>(
                    stream: Topcourse,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "ERROR",
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, position) {
                            return Padding(
                              padding:  EdgeInsets.only(left: 20.w, right: 10.w),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Video(    videopassing: snapshot
                                          .data!
                                          .docs[position]["videos"],
                                        coursename: snapshot.data!
                                            .docs[position]["courseName"]
                                            .toString(),
                                        aboutcourse: snapshot
                                            .data!.docs[position]["about"]
                                            .toString(),
                                        image: snapshot.data!
                                            .docs[position]["img"]
                                            .toString(), id:  snapshot.data!
                                            .docs[position]["id"]
                                            .toString(), tutter:  snapshot.data!
                                            .docs[position]["tutter"]
                                            .toString(), ratting:  snapshot.data!
                                            .docs[position]["ratting"]
                                            .toString(), price: snapshot.data!
                                              .docs[position]["price"].toString(),

                                      )));
                                },
                                child: Container(
                                  width: 180.w,
                                  height: 160.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 180.w,
                                          height: 110.h,
                                          child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                                              child: Image.network(
                                                snapshot.data!.docs[position]
                                                ["img"],
                                                fit: BoxFit.cover,
                                              ))),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10.w, top: 10.h),
                                        child: Row(
                                          children: [
                                            Text(
                                        snapshot.data!.docs[position]
                                            ["ratting"].toString(),
                                              style: GoogleFonts.plusJakartaSans(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF1D1B20),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.h),
                                            RatingBar.builder(
                                              initialRating: snapshot.data!.docs[position]["ratting"],
                                              minRating: 1.sp,
                                              itemSize: 17.sp,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              ignoreGestures: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Color(0xFF477B72),
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10.w, top: 5.h),
                                        child: Text(
                                          snapshot.data!.docs[position]["courseName"].toString(),
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              color: Color(0xFF1D1B20),
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10.w, top: 5.h),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person_outlined,
                                              size: 20.sp,
                                            ),
                                            Text(
                                              snapshot.data!.docs[position]["tutter"],
                                              style: GoogleFonts.plusJakartaSans(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF060302),
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10.w, top: 5.h),
                                        child: Text(
                                          "\$ ${snapshot.data!.docs[position]['price']}",
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              color: Color(0xFF477B72),
                                              fontSize: 13.sp,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, position) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 10.h, left: 10.w),
                child: Row(
                  children: [
                    Text(
                      'Top Sellers',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 205.w),
                    Text(
                      'See All',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 230.h,
                width: double.infinity,
                child: StreamBuilder<QuerySnapshot>(
                  stream: Topseller,
                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
      return Center(
      child: CircularProgressIndicator(),
      );
      }
      if (snapshot.hasError) {
      return Center(
      child: Text(
      "ERROR",
      style: TextStyle(color: Colors.red),
      ),
      );
      }
      if (snapshot.hasData) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, position) {
                        return Padding(
                          padding:  EdgeInsets.only(left: 20.w, right: 10.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Video(videopassing: snapshot
                                      .data!
                                      .docs[position]["videos"],
                                    coursename: snapshot.data!
                                        .docs[position]["courseName"]
                                        .toString(),
                                    aboutcourse: snapshot
                                        .data!.docs[position]["about"]
                                        .toString(), image: snapshot.data!
                                        .docs[position]["img"]
                                        .toString(), id:  snapshot.data!
                                        .docs[position]["id"]
                                        .toString(), tutter:  snapshot.data!
                                        .docs[position]["tutter"]
                                        .toString(), ratting:  snapshot.data!
                                        .docs[position]["ratting"]
                                        .toString(), price: snapshot.data!
                                        .docs[position]["price"].toString(),)));
                            },
                            child: Container(
                              width: 180.w,
                              height: 160.h,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 180.w,
                                      height: 110.h,
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                                          child: Image.network(
                                            snapshot.data!.docs[position]
                                            ["img"],
                                            fit: BoxFit.cover,
                                          ))),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.w, top: 10.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          snapshot.data!.docs[position]["ratting"].toString(),
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              color: Color(0xFF1D1B20),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.h),
                                        RatingBar.builder(
                                          initialRating: snapshot.data!.docs[position]["ratting"],
                                          minRating: 1.sp,
                                          itemSize: 17.sp,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          ignoreGestures: true,
                                          itemCount: 5,
                                          itemPadding:
                                              EdgeInsets.symmetric(horizontal: 1.w),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Color(0xFF477B72),
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.w, top: 5.h),
                                    child: Text(
                                      snapshot.data!.docs[position]["courseName"].toString(),
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: TextStyle(
                                          color: Color(0xFF1D1B20),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.w, top: 5.h),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person_outlined,
                                          size: 20.sp,
                                        ),
                                        Text(
                                          snapshot.data!.docs[position]["tutter"].toString(),
                                          style: GoogleFonts.plusJakartaSans(
                                            textStyle: TextStyle(
                                              color: Color(0xFF060302),
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.w, top: 5.h),
                                    child: Text(
                                        "\$ ${snapshot.data!.docs[position]['price']}",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: TextStyle(
                                          color: Color(0xFF477B72),
                                          fontSize: 13.sp,
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, position) {
                        return SizedBox(
                          width: 5.w,
                        );
                      },
                    );
                  }else {return SizedBox();}}
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
