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
  final navigation = [
   Home(),
    Bookmark(),
    Search(),
    Chat(),
    Profile()

  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(showSelectedLabels: false,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: currentindex==0? Color(0xFF8204FF): Colors.black), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book,color: currentindex==1? Color(0xFF8204FF): Colors.black), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: currentindex==2? Color(0xFF8204FF): Colors.black), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.chat,color: currentindex==3? Color(0xFF8204FF): Colors.black), label: "Email"),
          BottomNavigationBarItem(icon: CircleAvatar(radius: 20.r,
            child: CircleAvatar(radius: 18.r,backgroundImage:AssetImage("assets/googlelogo.png"))), label: "Email"),
        ],
      ),
      body:navigation[currentindex] ,
    );
  }
}
