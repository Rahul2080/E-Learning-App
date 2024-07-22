import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Bottomnavigation.dart';
import 'package:ecommerce/Phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';
import 'Onboard.dart';
import 'Signin.dart';
import 'ToatMessage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('Users');

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController name = TextEditingController();

  bool Visible = true;
  bool passwordVisible = true;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SafeArea(
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Full Name',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                    hintStyle: TextStyle(
                      color: Color(0xFF858383),
                      fontSize: 15.sp,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Email',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Color(0xFF858383),
                      fontSize: 15.sp,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Password',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: password,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter password",
                      hintStyle: TextStyle(
                        color: Color(0xFF858383),
                        fontSize: 15.sp,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                      ),
                      suffix: InkWell(
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      )),
                  validator: (value) {
                    if (value!.isEmpty|| value.length<6) {
                      return 'Enter a valid password!';
                    }

                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Confirm Password',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  controller: confirmpassword,
                  obscureText: Visible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Confirm password",
                      hintStyle: TextStyle(
                        color: Color(0xFF858383),
                        fontSize: 15.sp,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                      ),
                      suffix: InkWell(
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onTap: () {
                          setState(
                            () {
                              Visible = !Visible;
                            },
                          );
                        },
                      )),
                  validator: (value) {
                    if (value!.isEmpty ||
                        password.text != confirmpassword.text) {
                      return 'Enter a valid password!';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 30),
                child: GestureDetector(
                    onTap: () {
                      final isValid = formkey.currentState?.validate();
                      if (isValid!) {
                        auth
                            .createUserWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .then((onValue) {
                          firestore.doc(auth.currentUser!.uid.toString()).set({
                            "name": name.text,
                            "id": auth.currentUser!.uid.toString(),
                            "email": email.text,
                            "password": password.text
                          });
                          checkLogin();
                          Fluttertoast.showToast(msg: "Succesfully Login");
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Bottomnavigation()),
                              (route) => false);
                        }).onError((error, stackTrace) => ToastMessage()
                                .toastmessage(message: error.toString()));
                      }
                      formkey.currentState?.save();
                    },
                    child: Container(
                      width: 316.w,
                      height: 57.h,
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      decoration: ShapeDecoration(
                        color: Color(0xD3F8C657),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 140),
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                      width: 130.w,
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )),
                  SizedBox(width: 5.w),
                  Text(
                    'Or Sign In With',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  SizedBox(
                      width: 130.w,
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 30),
                child: Row(
                  children: [
                    GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Phone()));},
                      child: Container(
                        width: 82.w,
                        height: 48.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 11),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFDDDDDD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Icon(
                          Icons.call,
                          color: Colors.blueGrey,
                          size: 30.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () {
                        signInwithGoogle();
                      },
                      child: Container(
                        width: 82.w,
                        height: 48.h,
                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFDDDDDD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Image.asset(
                          "assets/googlelogo.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, top: 40),
                child: Row(
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          color: Color(0xFF6C6C6C),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Signin()));
                      },
                      child: Text(
                        'Login Here',
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            color: Color(0xFFF8C657),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> signInwithGoogle() async {
    checkLogin();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential).then((onValue) =>
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Home())));
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  void checkLogin()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Token', true);
  }
}
