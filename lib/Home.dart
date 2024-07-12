import 'package:ecommerce/Categories.dart';
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
  List<String> categories = ["Bussiness", "UI/UX", "Marketing",'SEO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 30.sp,
          )
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
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        color: Color(0xFF1D1B20),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180.w,
                  ),
                  GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Categories()));},
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    'Students Also Search for',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        color: Color(0xFF1D1B20),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 60.w),
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
            SizedBox(height: 10.h,),
            SizedBox(
              height: 260.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Container(
                      width: 180.w,
                      height: 140.h,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/listimg.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
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
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1),
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
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text(
                              'UI/UX Design',
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  color: Color(0xFF1D1B20),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_outlined,
                                  size: 24.sp,
                                ),
                                Text(
                                  'Stephen Moris',
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                      color: Color(0xFF060302),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text(
                              '\$14.50',
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  color: Color(0xFF477B72),
                                  fontSize: 18.sp,
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

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    'Top Courses in IT ',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        color: Color(0xFF1D1B20),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 136.w),
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
            SizedBox(height: 10.h,),
            SizedBox(
              height: 260.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Container(
                      width: 180.w,
                      height: 160.h,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/listimg.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
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
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1),
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
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text(
                              'UI/UX Design',
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  color: Color(0xFF1D1B20),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_outlined,
                                  size: 24.sp,
                                ),
                                Text(
                                  'Stephen Moris',
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                      color: Color(0xFF060302),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text(
                              '\$14.50',
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  color: Color(0xFF477B72),
                                  fontSize: 18.sp,
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Text(
                    'Top Sellers',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        color: Color(0xFF1D1B20),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 195.w),
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
            ), SizedBox(height: 10.h,),
            SizedBox(
              height: 260.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Container(
                      width: 180.w,
                      height: 160.h,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/listimg.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
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
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1),
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
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text(
                              'UI/UX Design',
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  color: Color(0xFF1D1B20),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_outlined,
                                  size: 24.sp,
                                ),
                                Text(
                                  'Stephen Moris',
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                      color: Color(0xFF060302),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text(
                              '\$14.50',
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  color: Color(0xFF477B72),
                                  fontSize: 18.sp,
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
            SizedBox(height: 10.h),
          ],
        ),

      ),
    );
  }
}
