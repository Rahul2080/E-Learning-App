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
  List<String> categories = ["Bussiness", "UI/UX", "Marketing", 'SEO'];
  @override
  Widget build(BuildContext context) {
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
          Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: SizedBox(
            height: 40.h,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10.w,
                );
              },
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, position) {
                return Container(
                  decoration: ShapeDecoration(
                    color: Color(0xFFC6D6D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      categories[position],
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
            ),
          ),
        ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 800.h,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: GestureDetector(onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Video()));
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 180.w,
                                  height: 180.h,
                                  child: Image.asset("assets/listimg.png")),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10, top: 5),
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
                                      padding:
                                          const EdgeInsets.only(left: 10, top: 5),
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
                      width: 20.w,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
