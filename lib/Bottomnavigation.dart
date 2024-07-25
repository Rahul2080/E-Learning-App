import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/Bookmark.dart';
import 'package:ecommerce/Chat.dart';
import 'package:ecommerce/Home.dart';
import 'package:ecommerce/Profile.dart';
import 'package:ecommerce/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  final navigation = [Home(), Bookmark(), Search(), Chat(), Profile()];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.white,
        height: 50.h,
        animationDuration: Duration(milliseconds: 500 ),
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          Icon(Icons.home,
              color: currentindex == 0 ? Colors.black : Colors.white),
          Icon(Icons.menu_book,
              color: currentindex == 1 ? Colors.black : Colors.white),
          Icon(Icons.search,
              color: currentindex == 2 ? Colors.black :Colors.white),
          Icon(Icons.chat,
              color: currentindex == 3 ? Colors.black : Colors.white),
          CircleAvatar(
              radius: 13.r,
              child: CircleAvatar(
                  radius: 15.r,
                  backgroundImage: AssetImage("assets/googlelogo.png"))),
        ],
      ),
      body: navigation[currentindex],
    );
  }
}
