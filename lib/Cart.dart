import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Video.dart';


class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth=FirebaseAuth.instance;
    final addtocart = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("Carts").snapshots();


    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30.sp,
            )),
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
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
            SizedBox(
              height: 800.h,
              child: StreamBuilder<QuerySnapshot>(
                stream: addtocart,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding:  EdgeInsets.only(left: 20.w, right: 10.w),
                        child: GestureDetector(onTap: () {
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
                                borderRadius: BorderRadius.circular(17.r),
                              ),
                            ),
                            width: 180.w,
                            height: 120.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 180.w,
                                    height: 180.h,
                                    child: ClipRRect(borderRadius: BorderRadius.circular(10.r),
                                            child: Image.network(snapshot.data!.docs[position]["img"].toString(),fit: BoxFit.cover,))),
                                Padding(
                                  padding:  EdgeInsets.only(left: 10.w, top: 10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                             EdgeInsets.only(left: 10.w, top: 5.h),
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
                                        padding:
                                             EdgeInsets.only(left: 10.w, top: 5.h),
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
                                      Padding(
                                        padding:  EdgeInsets.only(left: 10.w,top: 3.h),
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
                                              initialRating: double.parse(snapshot.data!
                                                  .docs[position]["ratting"]),
                                              minRating: 1,
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

                                    ],
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
                        height: 20.h,
                      );
                    },
                  );
                }else { return SizedBox();} }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
