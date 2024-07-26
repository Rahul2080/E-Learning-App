import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cart.dart';
import 'Video.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchbar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firestore =
        FirebaseFirestore.instance.collection("StudentCourse").snapshots();
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  height: 50.h,
                  width: 300.w,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextField(onSubmitted: (value){
                    setState(() {

                    });
                  },onChanged: (value){
                    setState(() {

                    });
                  },
                    controller: searchbar,
                    decoration: InputDecoration(
                      hintText: "Search.....",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
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
            ),
          ),
        ),
        SizedBox(height: 30.h),
        StreamBuilder<QuerySnapshot>(
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
                  child: Text(
                    "ERROR",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              if (snapshot.hasData) {
                print(searchbar.text);
                return SizedBox(
                  height: 220.h,
                  child: ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, position) {
                      if (searchbar.text.toLowerCase() ==
                          snapshot.data!.docs[position]["courseName"]
                              .toString()
                              .toLowerCase()) {
                        print(snapshot.data!.docs[position]["courseName"]
                            .toString()
                            .toLowerCase());
                        return GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Video(videopassing: snapshot
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
                              .docs[position]["price"].toString(),)));},
                          child: Container(
                            width: 180.w,
                            height: 160.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 180.w,
                                    height: 110.h,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          snapshot.data!.docs[position]["img"],
                                          fit: BoxFit.cover,
                                        ))),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        snapshot.data!.docs[position]["ratting"]
                                            .toString(),
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
                                        initialRating: snapshot
                                            .data!.docs[position]["ratting"],
                                        minRating: 1,
                                        itemSize: 17.sp,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 1),
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    snapshot.data!.docs[position]["courseName"]
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "\$ ${snapshot.data!.docs[position]['ratting']}",
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
                      } else {
                        return SizedBox();
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                  ),
                );
              } else {
                return SizedBox();
              }
            }),
      ],
    ));
  }
}
