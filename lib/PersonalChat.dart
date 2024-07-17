import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Personalchat extends StatefulWidget {
  const Personalchat({super.key});

  @override
  State<Personalchat> createState() => _PersonalchatState();
}

class _PersonalchatState extends State<Personalchat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        toolbarHeight: 75.h,
        title: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
            ),
            SizedBox(width: 10.w),
            Text(
              'Jackie',
              style: GoogleFonts.notoSans(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17.82.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          BubbleSpecialThree(
            text: 'Hello',
            color: Color(0xFFE8E8EE),
            tail: false,
            isSender: false,
          ),
          BubbleSpecialThree(
            text: 'Hi',
            color: Colors.blue.shade100,
            tail: false,
            isSender: true,
          ),
        ],
      ),
    );
  }
}
