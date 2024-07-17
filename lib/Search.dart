import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search.....",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 30.sp,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: Text(
            'Trending',
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 10),
          child: FilterChip(
            label: Text("text"),
            backgroundColor: Colors.transparent,
            shape: StadiumBorder(side: BorderSide()),
            onSelected: (bool value) {print("selected");},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 20),
          child: Text(
            'Based on your Search',
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20,top: 10),
          child: FilterChip(
            label: Text("text"),
            backgroundColor: Colors.transparent,
            shape: StadiumBorder(side: BorderSide()),
            onSelected: (bool value) {print("selected");},
          ),
        ),





      ],
    ));
  }
}
