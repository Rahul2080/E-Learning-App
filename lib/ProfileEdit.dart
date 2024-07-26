import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profileedit extends StatefulWidget {
  const Profileedit({super.key});

  @override
  State<Profileedit> createState() => _ProfileeditState();
}
final Firestore = FirebaseFirestore.instance.collection("Users").snapshots();

final ref = FirebaseFirestore.instance.collection("Users");
TextEditingController controller = TextEditingController();
class _ProfileeditState extends State<Profileedit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          return Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80, top: 70),
                        child: Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Icon(Icons.image_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text("dsbhgzfygizvh"),
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
                              ref
                                  .doc(snapshot.data!
                                  .docs[0]["id"]
                                  .toString())
                                  .update({
                                "name": controller.text
                              }).then((onValue) {
                                Fluttertoast.showToast(
                                    msg: "Update Succesfully");
                              }).onError((error, StackTrace) {
                                Fluttertoast.showToast(
                                    msg: "Error");
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
              )
            ],
          );
        }else{return SizedBox();}}
      ),
    );
  }
}
