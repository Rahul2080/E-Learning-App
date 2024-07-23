import 'package:flutter/material.dart';
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
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: GestureDetector(onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (_) => Video()));
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
    );
  }
}
