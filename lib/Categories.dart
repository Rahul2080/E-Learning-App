import 'package:ecommerce/StartCourseVideos.dart';
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
          GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Cart()));},
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
            ExpandedTileList.builder(
              itemCount: 5,
              maxOpened: 3,
              reverse: true,
              itemBuilder: (context, index, con) {
                return ExpandedTile(
                  theme: const ExpandedTileThemeData(
                    headerColor: Color(0xFFC6D6D3),
                    headerPadding: EdgeInsets.all(24.0),
                    headerSplashColor: Colors.red,

                    //
                    contentBackgroundColor: Colors.white,
                    contentPadding: EdgeInsets.all(24.0),

                  ),
                  controller: con,
                  title: Text("Design"),
                  content: SizedBox(
                    height: 250.h,
                    width: 250.w,
                    child:  ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, position) {
                        return GestureDetector(onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Startcoursevideos()));
                        },
                          child: Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            width: 180.w,
                            height: 140.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/listimg.png"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "4.5",
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
                                        initialRating: 3,
                                        minRating: 1,
                                        itemSize: 20.sp,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
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
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    'UI/UX Design',
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
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_outlined,
                                        size: 20.sp,
                                      ),
                                      Text(
                                        'Stephen Moris',
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
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    '\$14.50',
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
            ),
          ],
        ),
      ),
    );
  }
}
