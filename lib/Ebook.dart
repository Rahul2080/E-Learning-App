import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/PersonalChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cart.dart';

class Ebook extends StatefulWidget {
  const Ebook({super.key});

  @override
  State<Ebook> createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
  final firestore = FirebaseFirestore.instance.collection("EBook").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFC6D6D3),
        foregroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.chat_outlined),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
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
            SizedBox(
              height: 678.h,
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
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        shrinkWrap: true,
                        children: List.generate(
                          snapshot.data!.docs.length,
                          (index) {
                            return Container(
                              decoration: ShapeDecoration(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child:
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        snapshot.data!.docs[index]["img"]
                                            .toString(),
                                        fit: BoxFit.cover,
                                      ),

                                      Text(snapshot.data!.docs[index]["courseName"]
                                          .toString()),
                                      Text(snapshot.data!.docs[index]["about"]
                                          .toString()),

                                      Row(
                                        children: [
                                          Text("4.5"),

                                          RatingBar.builder(
                                            initialRating: snapshot.data!
                                                .docs[index]["ratting"],
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

                                    ],
                                  ),


                            );
                          },
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
