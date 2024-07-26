import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cart.dart';
import 'Video.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth=FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("SavedCollections").snapshots();

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
        title: Text(
          'Courses',
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              color: Color(0xFF1D1B20),
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 800.h,
                child:StreamBuilder<QuerySnapshot>(
                    stream: firestore,
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
                        return GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,childAspectRatio: 360/450,
                          mainAxisSpacing: 10.0,
                          shrinkWrap: true,
                          children: List.generate(snapshot.data!.docs.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:Container( width: 180.w,
                                height: 190.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
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
                                            BorderRadius.circular(10),
                                            child: Image.network(
                                              snapshot.data!.docs[index]
                                              ["img"].toString(),
                                              fit: BoxFit.cover,
                                            ))),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            snapshot
                                                .data!.docs[index]["ratting"]
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
                                            initialRating: double.parse(snapshot.data!
                                                .docs[index]["ratting"].toString()),
                                            minRating: 1,
                                            itemSize: 16.sp,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            ignoreGestures: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1),
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
                                      padding: const EdgeInsets.only(
                                        left: 10, ),
                                      child: Text(
                                        snapshot.data!.docs[index]
                                        ["courseName"].toString(),
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
                                      padding: const EdgeInsets.only(
                                        left: 10,),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_outlined,
                                            size: 20.sp,
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                            ["tutter"].toString(),
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
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        "\$ ${snapshot.data!.docs[index]['ratting'].toString()}",
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
                          },),
                        );
                      }else {return SizedBox();}}
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
