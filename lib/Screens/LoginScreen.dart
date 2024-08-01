import 'dart:developer';

import 'package:blood/Screens/HomeScreen.dart';
import 'package:blood/Screens/SignUpScreen.dart';
import 'package:blood/Screens/introScreens/IntroScreen1.dart';
import 'package:blood/Screens/introScreens/OnBoardingScreen.dart';
import 'package:blood/Widgets/AppMessage.dart';
import 'package:blood/styles/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  late String email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Image.asset('assets/Images/BloodDonation.png'),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(50),
            child: Text(
              'تسجيـل الدخول',
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        ' البريد الالكتروني',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل بريدك الالكتروني';
                          }
                        },
                        style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w900),
                        decoration: const InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 155, 29, 29),
                                width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 155, 29, 29),
                                width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          errorStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w900),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email_rounded,
                              size: 35,
                              color: Colors.grey,
                            ),
                          ),
                          fillColor: Color.fromARGB(255, 247, 245, 245),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 155, 29, 29),
                                width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'كلمة المرور',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل كلمة المرور';
                          }
                        },
                        obscuringCharacter: '*',
                        obscureText: true,
                        style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w900),
                        decoration: InputDecoration(
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 155, 29, 29),
                                width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 155, 29, 29),
                                width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          errorStyle: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w900),
                          helper: Row(
                            children: [
                              const Text(
                                'ليس لديك حساب ؟ ',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                child: const Text(
                                  'انشاء حساب',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 196, 30, 30),
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                          fillColor: const Color.fromARGB(255, 247, 245, 245),
                          filled: true,
                          contentPadding: const EdgeInsets.all(16),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 155, 29, 29),
                                width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          final UserCredential userCredential =
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email!, password: password!);
                          userName =
                              userCredential.user!.displayName.toString();
                          userLastName =
                              userCredential.user!.photoURL.toString();
                          emailOfRequest = email;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              content: AppMessage(
                                message: '! تم تسجيل الدخول بنجاح ✅',
                              ),
                            ),
                          );
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 1),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              content: AppMessage(
                                message: '! حساب غير موجود 🚨',
                              ),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                content: AppMessage(
                                  message: '! خطأ في البريد او كلمة المرور ❌',
                                ),
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              content: AppMessage(
                                message: '! يجب ادخال البريد وكلمة المرور ⚠️',
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 15),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 1.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'تسجيـل الدخول',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 25,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        signInWithGoogle(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 1.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    ' تسجيـل عن طريق جوجل',
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 25,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Image.asset(
                                    'assets/Images/google_720255.png',
                                    height: 40,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signInWithGoogle(BuildContext _context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    userName = googleUser!.displayName.toString();

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(
      _context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
