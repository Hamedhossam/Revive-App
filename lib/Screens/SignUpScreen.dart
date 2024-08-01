import 'dart:developer';

import 'package:blood/Screens/LoginScreen.dart';
import 'package:blood/Widgets/AppMessage.dart';
import 'package:blood/styles/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;

  String? password;

  String? firstName;
  String? lastName;

  BloodType? selectedBloodType;

  String bloodType = 'A+';

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 30,
            )),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Image.asset('assets/Images/BloodDonation.png'),
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'انشاء حساب جديد',
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'الاسم الاول',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, right: 15, bottom: 15, left: 210),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'رجاء ادخال الاسم';
                          } else if (value.length > 9) {
                            return 'ادخل اسم قصير';
                          }
                        },
                        onChanged: (value) {
                          firstName = value;
                        },
                        style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w900),
                        decoration: const InputDecoration(
                          helper: Text(
                            'يفضل اللغة العربية',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 17,
                              color: Color.fromARGB(255, 3, 224, 51),
                            ),
                          ),
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
                        'اسم العائلة',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, right: 15, bottom: 15, left: 210),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'رجاء ادخال الاسم';
                          } else if (value.length > 9) {
                            return 'ادخل اسم قصير';
                          }
                        },
                        onChanged: (value) {
                          lastName = value;
                        },
                        style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w900),
                        decoration: const InputDecoration(
                          helper: Text(
                            'يفضل اللغة العربية',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 17,
                              color: Color.fromARGB(255, 3, 224, 51),
                            ),
                          ),
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
                        ' فصيلة الدم ',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    selectedBloodType == null
                        ? GestureDetector(
                            onTap: () {
                              selectedBloodType = bloodTypes[2];

                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70.0, vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: lightColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'اختر فصيلة الدم',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 17,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.ads_click_outlined)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: DropdownButton<BloodType>(
                              alignment: AlignmentDirectional.bottomCenter,
                              value: selectedBloodType,
                              onChanged: (value) {
                                bloodType = value!.nameAr;
                                setState(() {
                                  selectedBloodType = value;
                                });
                              },
                              items: bloodTypes.map((blood) {
                                return DropdownMenuItem<BloodType>(
                                  value: blood,
                                  onTap: () {
                                    selectedBlood = blood.nameAr;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: lightColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            blood.nameAr,
                                            style: const TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 17,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              dropdownColor: Colors.white,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Cairo',
                                fontSize: 16,
                              ),
                              icon: const Icon(
                                CupertinoIcons.arrow_down,
                                color: Colors.white,
                              ),
                              iconSize: 24,
                              underline: SizedBox.shrink(),
                              elevation: 16,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(16),
                              // ),
                            ),
                          ),
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
                      padding: EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'رجاء ادخال بريد الكتروني';
                          } else {
                            if ((value.contains('@') &&
                                    value.contains('.com')) ==
                                false) {
                              return 'رجاء ادخال بريد صحيح';
                            }
                          }
                        },
                        onChanged: (value) {
                          email = value;
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'رجاء ادخال كلمة مرور';
                          } else {
                            if (value.length < 9) {
                              return 'كلمة المرور ضعيفة (اقل من 9 ارقام)';
                            }
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        obscuringCharacter: '*',
                        obscureText: true,
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
                        'تأكيد كلمة المرور',
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
                        validator: (value) {
                          if (value != password) {
                            return 'كلمة المرور غير مطابقة';
                          }
                        },
                        obscuringCharacter: '*',
                        obscureText: true,
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
                    GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            await userCredential.user!.updateProfile(
                              displayName: firstName,
                              photoURL: lastName,
                            );
                            // userName = name;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                content: AppMessage(
                                  message: '! تم انشاء الحساب بنجاح ✅',
                                ),
                              ),
                            );
                            await Future.delayed(Duration(seconds: 1));
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                content: AppMessage(
                                  message: '! كلمة مرور ضعيفة 🚨',
                                ),
                              ));
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  content: AppMessage(
                                    message: '! هذا الحساب موجود بالفعل 🚨',
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                content: AppMessage(
                                  message: e.toString(),
                                ),
                              ),
                            );
                          }
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
                                'انشاء الحساب ',
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
