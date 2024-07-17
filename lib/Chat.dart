import 'package:ecommerce/PersonalChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> categories = [
    "All",
    "Latest",
  ];

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
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 30.sp,
              ),
            )
          ],
          title: Text(
            'Chat',
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
              SizedBox(
                height: 630.h,
                child: ListView.separated(
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Personalchat()));
                      },
                      child: ListTile(
                        title: Text("helllo"),
                        leading: CircleAvatar(
                          radius: 30.r,
                        ),
                        subtitle: Text(" chat on me"),
                      ),
                    );
                  },
                  separatorBuilder: (context, position) {
                    return SizedBox(
                      height: 5.h,
                    );
                  },
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ));
  }
}
