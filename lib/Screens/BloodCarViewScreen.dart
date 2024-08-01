import 'dart:developer';

import 'package:blood/Classes/BloodCarModel.dart';
import 'package:blood/Classes/apis.dart';
import 'package:blood/Screens/BloodCarsScreen.dart';
import 'package:blood/Screens/HomeScreen.dart';
import 'package:blood/Screens/SignUpScreen.dart';
import 'package:blood/styles/Colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Bloodcarviewscreen extends StatefulWidget {
  late BloodCarModel? bloodCarObject;
  Bloodcarviewscreen({
    super.key,
    required this.bloodCarObject,
  });

  @override
  State<Bloodcarviewscreen> createState() => _BloodcarviewscreenState();
}

class _BloodcarviewscreenState extends State<Bloodcarviewscreen> {
  BloodType? selectedBloodType;
  GlobalKey<FormState> formKey = GlobalKey();
  BloodCarModel? bloodCarModel;
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String email = '';
  String hospitalname = '';
  String name = '';
  String bloodType = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloodCarModel = widget.bloodCarObject;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Color.fromARGB(255, 36, 129, 252),
        shadowColor: const Color.fromARGB(255, 14, 100, 170),
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 5),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(CupertinoIcons.back),
                color: primaryColor,
                iconSize: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 65.0),
                child: Text(
                  'تسجيل طلب تبرع',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Form(
            key: formKey,
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: primaryColor, width: 1),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGC-2Ddku1BN5urFOVPPCAbVQ8n9pDyFev3g&s')),
                      ),
                    ),
                  ),
                  Text(
                    bloodCarModel!.name,
                    style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 22,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '  الاسم',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'رجاء ادخال الاسم';
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
                          color: Color.fromARGB(255, 155, 29, 29), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 155, 29, 29), width: 2),
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
                      borderSide: BorderSide(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  ' البريد الالكتروني',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'رجاء ادخال بريد الكتروني';
                    } else {
                      if ((value.contains('@') && value.contains('.com')) ==
                          false) {
                        return 'رجاء ادخال بريد صحيح';
                      }
                    }
                  },
                  style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.email,
                      size: 30,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 155, 29, 29), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 155, 29, 29), width: 2),
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
                      borderSide: BorderSide(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2),
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
                      color: primaryColor,
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
                              color: primaryColor,
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
                                        color: lightColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.ads_click_outlined,
                                    color: Colors.white,
                                  )
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
                                    borderRadius: BorderRadius.circular(15)),
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
                          color: primaryColor,
                        ),
                        iconSize: 24,
                        underline: SizedBox.shrink(),
                        elevation: 16,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(16),
                        // ),
                      ),
                    ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(primaryColor)),
                        onPressed: () async {
                          await showCupertinoModalPopup<void>(
                            context: context,
                            builder: (_) {
                              final size = MediaQuery.of(context).size;
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                height: size.height * 0.27,
                                child: CupertinoDatePicker(
                                  minimumYear: 2024,
                                  maximumYear: 2024,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (value) {
                                    date = value;

                                    setState(() {});
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              ' اختر الموعد ',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ' ${date.day.toString()}  - ${date.month.toString()} - ${date.year.toString()}',
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          icon: Image.asset(
                            'assets/Images/check-box_8622156.png',
                            height: MediaQuery.sizeOf(context).height / 23,
                          ),
                          title: const Text(
                            'تم تأكيد الطلب',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color: Color.fromARGB(255, 58, 154, 61),
                                fontWeight: FontWeight.w900),
                          ),
                          content: const Text(
                            textAlign: TextAlign.center,
                            "سيتم التواصل معك عن طريق البريد الالكتروني برجاء تفقد البريد في خلال( 24 ساعة المقبلة )",
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color: primaryColor,
                                fontWeight: FontWeight.w900),
                          ),
                        );
                      },
                    );

                    if (formKey.currentState!.validate()) {
                      Map<String, dynamic> newDonorData = {
                        "hospitalname": hospitalname,
                        "email": email,
                        "bloodType": bloodType,
                        "bookingdate": date.toString(),
                        "name": name,
                        "city": 'الغربية',
                      };

                      try {
                        final dio = Dio();

                        final response = await dio.post(
                          'https://blood-if5o.onrender.com/api/need',
                          data: newDonorData,
                        );

                        if (response.statusCode == 200) {
                          log('Data posted successfully!');
                        } else {
                          log('Error posting data: ${response.statusCode}');
                        }
                      } catch (e) {
                        log('Error: $e');
                      }
                    }
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'تسجيـل الطلب',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
