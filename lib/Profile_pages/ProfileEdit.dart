import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../ToatMessage.dart';

class Profileedit extends StatefulWidget {
  final int index;


  const Profileedit({super.key, required this.index});

  @override
  State<Profileedit> createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {
  FirebaseAuth auth = FirebaseAuth.instance;
  File? image;
  final picker = ImagePicker();

  Future getImageGallery(AsyncSnapshot<QuerySnapshot> snapshot) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("hello" + pickedFile.path);
        final id = DateTime.now().microsecondsSinceEpoch.toString();
        Reference folder = Storage.ref("/Folder name/" + id);
        UploadTask uploadtask = folder.putFile(image!.absolute);
        Future.value(uploadtask).then((onValue) async {
          var newUrl = await folder.getDownloadURL();
          ref
              .doc(snapshot.data!.docs[widget.index]["id"].toString())
              .update({"profile": newUrl.toString()}).then((Value) {
            ToastMessage().toastmessage(message: "Upload Succesfully");
          }).onError((e, s) {});
        });
      }
    });
  }

  Future getImageCamera(AsyncSnapshot<QuerySnapshot> snapshot) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("hello" + pickedFile.path);

        final id = DateTime.now().microsecondsSinceEpoch.toString();
        Reference folder = Storage.ref("/Folder name/" + id);
        UploadTask uploadtask = folder.putFile(image!.absolute);
        Future.value(uploadtask).then((onValue) async {
          var newUrl = await folder.getDownloadURL();
          ref
              .doc(snapshot.data!.docs[widget.index]["id"].toString())
              .update({"profile": newUrl.toString()}).then((Value) {
            ToastMessage().toastmessage(message: "Upload Succesfully");
          }).onError((error, s) {ToastMessage().toastmessage(message: error.toString());});
        });



      } else {
        print("No image Picked");
      }
    });
  }

  FirebaseStorage Storage = FirebaseStorage.instance;

  final Firestore = FirebaseFirestore.instance.collection("Users").snapshots();
  final ref = FirebaseFirestore.instance.collection("Users");
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "ERROR",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            if (snapshot.hasData) {
              return Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Container(
                              width: 120.w,
                              height: 120.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                              child: Opacity(
                                opacity: .7.sp,
                                child: image != null
                                    ? Image.file(
                                        image!.absolute,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                  snapshot.data!.docs[widget.index]["profile"].toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 80.w, top: 70.h),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 150.h,
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                 EdgeInsets.only(left: 70.w),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    getImageCamera(snapshot);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    width: 100.w,
                                                    height: 100.h,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.r),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                           EdgeInsets.only(
                                                              top: 20.h),
                                                      child: Column(
                                                        children: [
                                                          Icon(
                                                            Icons.camera_alt,
                                                            color: Colors.white,
                                                            size: 40.sp,
                                                          ),
                                                          Text(
                                                            "Take a Photo",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 50.w),
                                                GestureDetector(
                                                  onTap: () {
                                                    getImageGallery(snapshot);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    width: 100.w,
                                                    height: 100.h,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.r),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                           EdgeInsets.only(
                                                              top: 20.h),
                                                      child: Column(
                                                        children: [
                                                          Icon(
                                                            Icons.insert_photo,
                                                            color: Colors.white,
                                                            size: 40.sp,
                                                          ),
                                                          Text(
                                                            "Gallery",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: Icon(Icons.image_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                        snapshot.data!.docs[widget.index]["name"].toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("update here"),
                            content: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Type here"),
                              maxLines: 4,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  print("hello"+controller.text);
                                  ref
                                      .doc(auth.currentUser!.uid.toString())
                                      .update({"name": controller.text}).then(
                                          (onValue) {
                                    Fluttertoast.showToast(
                                        msg: "Update Succesfully");
                                  }).onError((error, StackTrace) {
                                    Fluttertoast.showToast(msg: "Error");
                                  });
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                  color: Colors.green,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("Update"),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15.w),
                    child: Text(snapshot.data!.docs[widget.index]["email"]),
                  )
                ],
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}
