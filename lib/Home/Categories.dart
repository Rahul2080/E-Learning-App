import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Home/StartCourseVideos.dart';
import 'package:ecommerce/Home/Video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cart.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final firestore =
      FirebaseFirestore.instance.collection("Categories").snapshots();
  late ExpandedTileController controller;

  void initState() {
    // initialize controller
    controller = ExpandedTileController(isExpanded: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Cart()));
            },
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30.sp,
            ),
          )
        ],
        title: Text(
          'Categories',
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
            StreamBuilder<QuerySnapshot>(
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
                    return ExpandedTileList.builder(
                      itemCount: snapshot.data!.docs.length,
                      maxOpened: 3,
                      reverse: true,
                      itemBuilder: (context, index, con) {
                        return ExpandedTile(
                          theme:  ExpandedTileThemeData(
                            headerColor: Color(0xFFC6D6D3),
                            headerPadding: EdgeInsets.all(24.0.sp),
                            headerSplashColor: Colors.white,

                            //
                            contentBackgroundColor: Colors.white,
                            contentPadding: EdgeInsets.all(24.0.sp),
                          ),
                          controller: con,
                          title: Text(
                            snapshot.data!.docs[index]["name"],
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Color(0xFF1D1B20),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          content: SizedBox(
                            height: 250.h,
                            width: 250.w,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data!.docs[index]["course"].length,
                              itemBuilder: (context, position) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => Video(videopassing:snapshot.data!.docs[index]["course"][position]["videos"],
                                              coursename: snapshot.data!.docs[index]["course"][position]["courseName"].toString(),
                                              aboutcourse: snapshot.data!.docs[index]["course"][position]["about"].toString(),
                                              image: snapshot.data!.docs[index]["course"][position]["img"].toString(),
                                              id:  snapshot.data!.docs[index]["course"][position]["id"].toString(),
                                              tutter:  snapshot.data!.docs[index]["course"][position]["tutter"].toString(),
                                              ratting:  snapshot.data!.docs[index]["course"][position]["ratting"].toString(),
                                              price: snapshot.data!.docs[index]["course"][position]["price"].toString(),
                                            ), ));
                                  },
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(17.r),
                                      ),
                                    ),
                                    width: 180.w,
                                    height: 140.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 180.w,
                                            height: 120.h,
                                            decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            child: ClipRRect(borderRadius: BorderRadius.circular(10.r),
                                              child: Image.network(snapshot
                                                      .data!.docs[index]["course"]
                                                  [position]["img"],fit: BoxFit.cover,),
                                            )),
                                        Padding(
                                          padding:  EdgeInsets.only(
                                              left: 10.w, top: 10.h),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot
                                                    .data!
                                                    .docs[index]["course"]
                                                        [position]["ratting"]
                                                    .toString(),
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFF1D1B20),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.h),
                                              RatingBar.builder(
                                                initialRating: snapshot.data!
                                                    .docs[index]["course"]
                                                [position]["ratting"],
                                                minRating: 1,
                                                glowColor: Colors.transparent,
                                                tapOnlyMode: true,
                                                itemSize: 20.sp,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                ignoreGestures: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 1.w),
                                                itemBuilder: (context, _) =>
                                                    Icon(
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
                                            snapshot
                                                .data!
                                                .docs[index]["course"][position]
                                                    ["courseName"]
                                                .toString(),
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
                                                snapshot
                                                    .data!
                                                    .docs[index]["course"]
                                                        [position]["tutter"]
                                                    .toString(),
                                                style:
                                                    GoogleFonts.plusJakartaSans(
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
                                          " \$  ${snapshot.data!.docs[index]['course'][position]['price'].toString()}",
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
                                );
                              },
                              separatorBuilder: (context, position) {
                                return SizedBox(
                                  width: 5.w,
                                );
                              },
                            ),
                          ),
                          onTap: () {
                            debugPrint("tapped!!");
                          },
                          onLongTap: () {
                            debugPrint("looooooooooong tapped!!");
                          },
                        );
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
