import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Home/StartCourseVideos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

import '../ToatMessage.dart';

class Video extends StatefulWidget {
  final List<dynamic> videopassing;
  final String coursename;
  final String aboutcourse;
  final String image;
  final String id;
  final String tutter;
  final String ratting;
  final String price;

  const Video({super.key,
    required this.videopassing,
    required this.coursename,
    required this.aboutcourse,
    required this.image,
    required this.id,
    required this.tutter,
    required this.ratting,
    required this.price});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool favarates = false;
  bool savedcollections = false;
  late FlickManager flickManager;
  FirebaseAuth auth = FirebaseAuth.instance;
  final updatepayment = FirebaseFirestore.instance
      .collection("Users");

  @override
  void initState() {
    super.initState();
    checkFavourate();
    checkSaved();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
          widget.videopassing[0]["url"],
        ),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {


    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response
            .message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    updatepayment.doc(auth.currentUser!.uid).update({"premium": true}).then((
        onValue) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) =>
              Startcoursevideos(Videolist: widget.videopassing,),),);

    }).onError((eroor, StackTrace) {
      Fluttertoast.showToast(msg: eroor.toString());
    });


    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  void dispose() {
    flickManager.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> checkFavourate() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final subcollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection("favorates");
    QuerySnapshot querySnapshot = await subcollection.get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]["id"].toString() == widget.id.toString()) {
        setState(() {
          favarates = true;
        });
      }
    }
  }

  Future<void> checkSaved() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final SavedSubcollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection("SavedCollections");
    QuerySnapshot querySnapshot = await SavedSubcollection.get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i]["id"].toString() == widget.id.toString()) {
        setState(() {
          savedcollections = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("favorates");
    final firestoresaved = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("SavedCollections");
    final addtocart = FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid.toString())
        .collection("Carts");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 310.h,
              color: Colors.black,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  Container(
                    width: 250.w,
                    height: 40.h,
                    child: Text(
                      widget.coursename,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    icon: savedcollections == true
                        ? Icon(
                      Icons.bookmark,
                      size: 30.sp,
                      color: Colors.black,
                    )
                        : Icon(
                      Icons.bookmark_outline,
                      size: 30.sp,
                    ),
                    onPressed: () {
                      if (savedcollections == true) {
                        firestoresaved.doc(widget.id).delete().then((onValue) {
                          Fluttertoast.showToast(msg: "removed");
                          setState(() {
                            savedcollections = false;
                          });
                        });
                      } else {
                        firestoresaved.doc(widget.id).set({
                          "img": widget.image,
                          "id": widget.id,
                          "videos": widget.videopassing,
                          "ratting": widget.ratting,
                          "price": widget.price,
                          "courseName": widget.coursename,
                          "about": widget.aboutcourse,
                          "tutter": widget.tutter,
                        }).then((onValue) {
                          Fluttertoast.showToast(msg: "added to saved");
                          setState(() {
                            savedcollections = true;
                          });
                        }).onError((error, stackTrace) =>
                            ToastMessage()
                                .toastmessage(message: error.toString()));
                      }
                      ;
                    },
                  ),
                  IconButton(
                      icon: favarates == true
                          ? Icon(Icons.favorite, color: Colors.red, size: 30.sp)
                          : Icon(
                        Icons.favorite_border,
                        size: 30.sp,
                      ),
                      onPressed: () {
                        checkFavourate();
                        if (favarates == true) {
                          firestore.doc(widget.id).delete().then((onValue) {
                            Fluttertoast.showToast(msg: "removed");
                            setState(() {
                              favarates = false;
                            });
                          });
                        } else {
                          firestore.doc(widget.id).set({
                            "img": widget.image,
                            "id": widget.id,
                            "videos": widget.videopassing,
                            "ratting": widget.ratting,
                            "price": widget.price,
                            "courseName": widget.coursename,
                            "about": widget.aboutcourse,
                            "tutter": widget.tutter,
                          }).then((onValue) {
                            Fluttertoast.showToast(msg: "added to Favourates");
                            setState(() {
                              favarates = true;
                            });
                          }).onError((error, stackTrace) =>
                              ToastMessage()
                                  .toastmessage(message: error.toString()));
                        }
                        ;
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w),
              child: Divider(
                color: Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                'About Course ',
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    color: Color(0xFF1D1B20),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: ReadMoreText(
                widget.aboutcourse,
                preDataTextStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                style: const TextStyle(color: Colors.black),
                colorClickableText: Colors.pink,
                trimCollapsedText: '...Show more',
                trimExpandedText: ' show less',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 38.w, top: 90.h),
              child: GestureDetector(
                onTap: () async {
                  final updatepayment = FirebaseFirestore.instance
                      .collection("Users").doc(auth.currentUser!.uid.toString());
                  DocumentSnapshot<Map<String,dynamic>>querysnapshot=await updatepayment.get();
                  if(querysnapshot ["premium"]==false){

                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 250.h,
                          width: double.infinity,
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 60.sp,
                                ),

                                Text(
                                    "Subscribe for Rs.100 and get access to \n All courses and EBooks. Enjoy Aditional \nfeatures like refer and ern money."),


                                SizedBox(height: 20.h),
                                GestureDetector(onTap: () {
                                  Razorpay razorpay = Razorpay();
                                  var options = {
                                    'key': 'rzp_test_gKANZdsNdLqaQs',
                                    'amount': 100,
                                    'name': 'Acme Corp.',
                                    'description': 'Fine T-Shirt',
                                    'retry': {'enabled': true, 'max_count': 1},
                                    'send_sms_hash': true,
                                    'prefill': {
                                      'contact': '8888888888',
                                      'email': 'test@razorpay.com'
                                    },
                                    'external': {
                                      'wallets': ['paytm']
                                    }
                                  };
                                  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                      handlePaymentErrorResponse);
                                  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                      handlePaymentSuccessResponse);
                                  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                      handleExternalWalletSelected);
                                  razorpay.open(options);
                                },
                                  child: Container(
                                    width: 170.w,
                                    height: 50.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.r),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Get Premium ",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.notoSans(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.workspace_premium)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });}
                  else{
                    Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => Startcoursevideos(Videolist:widget.videopassing,)));}
                },
                child: Container(
                  width: 300.w,
                  height: 65.h,
                  decoration: ShapeDecoration(
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Start Course!..',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 38.w, top: 30.h),
              child: GestureDetector(
                onTap: () {
                  addtocart.doc(widget.id).set({
                    "img": widget.image,
                    "id": widget.id,
                    "videos": widget.videopassing,
                    "ratting": widget.ratting,
                    "price": widget.price,
                    "courseName": widget.coursename,
                    "about": widget.aboutcourse,
                    "tutter": widget.tutter,
                  }).then((onValue) {
                    Fluttertoast.showToast(msg: "added to Cart");
                  }).onError((error, stackTrace) =>
                      ToastMessage().toastmessage(message: error.toString()));
                },
                child: Container(
                  width: 300.w,
                  height: 65.h,
                  decoration: ShapeDecoration(
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Add to cart',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
