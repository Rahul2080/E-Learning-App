import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ToatMessage.dart';

class Personalchat extends StatefulWidget {
  const Personalchat({super.key});

  @override
  State<Personalchat> createState() => _PersonalchatState();
}

class _PersonalchatState extends State<Personalchat> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    TextEditingController messagecontroller = TextEditingController();
    final firestore = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("chat");
    final chatview = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("chat")
        .snapshots();
    return Scaffold(
      bottomSheet: Padding(
        padding:  EdgeInsets.only(left: 20.w, bottom: 20.h),
        child: Row(
          children: [
            Container(
              width: 290.w,
              height: 40.h,
              decoration: ShapeDecoration(
                color: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: TextField(
                controller: messagecontroller,
                decoration: InputDecoration(
                    hintText: "Message",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.emoji_emotions_outlined,
                      size: 30.sp,
                    )),
              ),
            ),
            SizedBox(width: 20.w),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.blue,
                size: 28.sp,
              ),
              onPressed: () {
                final id = DateTime.now().microsecondsSinceEpoch.toString();
                firestore
                    .doc(id)
                    .set({"message": messagecontroller.text, "id": id,"response": ""}).then(
                        (onValue) {
                  messagecontroller.clear();
                 // ToastMessage().toastmessage(message: "");
                }).onError((error, StackTrace) =>
                        ToastMessage().toastmessage(message: error.toString()));
              },
            )
          ],
        ),
      ),


      appBar: AppBar(
        leadingWidth: 40.w,
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
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: chatview,
              builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
    return Center(
    child: CircularProgressIndicator(),
    );
    }
    if (snapshot.hasError) {

    return Center(
    child: Text("ERROR",style: TextStyle(color: Colors.red),),
    );
    }
    if (snapshot.hasData) {
                return ListView.builder(reverse: false,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, position) {
                    return   Column(
                      children: [
                        Container(
                          child: ChatBubble(
                            clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 20.h),
                            backGroundColor: Colors.blue,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width *0.7,
                              ),
                              child: Text(snapshot.data!.docs[position]["message"].toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                    snapshot.data!.docs[position]["response"].toString()==""? SizedBox():
                        ChatBubble(
                          clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 20.h),
                          backGroundColor: Colors.grey,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: Text(snapshot.data!.docs[position]["response"].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );

                  },
                );
              }else{return SizedBox();}}
            ),
          ),
          SizedBox(height: 70.h,)
        ],
      ),
    );
  }
}
