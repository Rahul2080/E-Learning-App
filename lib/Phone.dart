import 'package:ecommerce/Otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10,top: 300),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "+91 123456789",
                  hintStyle: TextStyle(
                    color: Color(0xFF858383),
                    fontSize: 15.sp,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60.h),

            GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Otp()));},
              child: Container(
                width: 316.w,
                height: 57.h,
                decoration: ShapeDecoration(
                  color: Color(0xD3F8C657),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 110,top: 10),
                  child: Text(
                    'Send OTP',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
