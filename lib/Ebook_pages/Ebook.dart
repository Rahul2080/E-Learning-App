import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_exit/non_web_preview.dart';
import 'package:ecommerce/Ebook_pages/PdfReader.dart';
import 'package:ecommerce/Profile_pages/PersonalChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home/Cart.dart';

class Ebook extends StatefulWidget {
  const Ebook({super.key});

  @override
  State<Ebook> createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
  final firestore = FirebaseFirestore.instance.collection("EBook").snapshots();

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
            )
          ],
          title: Text(
            'E-Book',
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                color: Color(0xFF1D1B20),
                fontSize: 23.sp,
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
                      return SizedBox(
                        height: 280.h,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.0.w,
                          childAspectRatio: 300/300,
                          shrinkWrap: true,
                          children: List.generate(
                            snapshot.data!.docs.length,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => Pdfreader(
                                            pdf: snapshot.data!.docs[index]["pdf"]
                                                .toString())));
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h),
                                    child: Container(height: 100.h,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(width: 200.w,height: 100.h,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                                              child: Image.network(
                                                snapshot.data!.docs[index]["img"]
                                                    .toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.w),
                                            child: Text(snapshot
                                                .data!.docs[index]["courseName"]
                                                .toString()),
                                          ),
                                          SizedBox(height: 3.h),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.w),
                                            child: Text(
                                              snapshot.data!.docs[index]["about"]
                                                  .toString(),
                                              maxLines: 2,style: TextStyle(fontSize: 9.sp),
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.w),
                                            child: Row(
                                              children: [

                                                Text( snapshot
                                                    .data!.docs[index]["ratting"].toString()),
                                                RatingBar.builder(
                                                  initialRating: snapshot
                                                      .data!.docs[index]["ratting"],
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
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
