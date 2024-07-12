import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: 342.w,
              height: 44.h,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Text(
                'Bussiness ',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: 342.w,
              height: 44.h,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Text(
                'UI/UX',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: 342.w,
              height: 44.h,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Text(
                  'Accounts ',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: 342.w,
              height: 44.h,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Text(
    'Software Engineering',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: 342.w,
              height: 44.h,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Color(0xFFC6D6D3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Text(
                'SEO',                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
