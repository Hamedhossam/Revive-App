import 'dart:developer';

import 'package:blood/Classes/apis.dart';
import 'package:blood/Screens/HomeScreen.dart';
import 'package:blood/Screens/SignUpScreen.dart';
import 'package:blood/Widgets/AppMessage.dart';
import 'package:blood/styles/Colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestBloodScreen extends StatefulWidget {
  const RequestBloodScreen({super.key});

  @override
  State<RequestBloodScreen> createState() => _RequestBloodScreenState();
}

class _RequestBloodScreenState extends State<RequestBloodScreen> {
  EgyptianGovernorate? selectedGovernorate;
  BloodType? selectedBloodType;
  GlobalKey<FormState> formKey = GlobalKey();
  int? _selectedNumber;

  String name = '';
  String bloodType = 'A+';
  String message = '';
  String phone = '';
  String city = 'الغربية';

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
                  Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
                      builder: (BuildContext context) => HomeScreen()));
                },
                icon: Icon(CupertinoIcons.back),
                color: primaryColor,
                iconSize: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    const Text(
                      'تسجيل طلب دم',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 25,
                          color: primaryColor,
                          fontWeight: FontWeight.w900),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height / 18,
                        width: MediaQuery.sizeOf(context).width / 8,
                        decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Image.asset(
                          'assets/Images/request.png',
                          height: MediaQuery.sizeOf(context).height / 20,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Form(
            key: formKey,
            child: ListView(physics: const BouncingScrollPhysics(), children: [
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
                  '  رقم الهاتف',
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
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    phone = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'رجاء ادخال رقم هاتف';
                    } else if (value.length != 11) {
                      return 'ادخل رقم صحيح';
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
                  '   المحافظة',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                ),
              ),
              selectedGovernorate == null
                  ? GestureDetector(
                      onTap: () {
                        selectedGovernorate = egyptianGovernorates[13];

                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'انقر لاختيار المحافظة',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DropdownButton<EgyptianGovernorate>(
                        alignment: AlignmentDirectional.bottomCenter,
                        value: selectedGovernorate,
                        onChanged: (value) {
                          city = value!.nameAr;
                          setState(() {
                            selectedGovernorate = value;
                          });
                        },
                        items: egyptianGovernorates.map((governorate) {
                          return DropdownMenuItem<EgyptianGovernorate>(
                            value: governorate,
                            onTap: () {
                              selectedCity = governorate.nameAr;
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      governorate.nameAr,
                                      style: const TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
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
                        icon: Icon(CupertinoIcons.arrow_down),
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
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'اختر فصيلة الدم',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
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
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      blood.nameAr,
                                      style: const TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
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
                        icon: Icon(CupertinoIcons.arrow_down),
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
                  'عدد الاكياس المطلوبة',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton<int>(
                      value: _selectedNumber,
                      hint: const Padding(
                        padding: EdgeInsets.only(right: 120.0),
                        child: Text(
                          'Select a number',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: primaryColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      items: List.generate(10, (index) => index + 1)
                          .map((number) => DropdownMenuItem<int>(
                                value: number,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 190.0),
                                  child: Text(
                                    '$number',
                                    style: const TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 22,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        bloodUnits = value.toString();
                        setState(() {
                          _selectedNumber = value;
                        });
                      }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '  اضافة رسالة',
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
                  maxLines: 3,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    message = value;
                  },
                  style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                  decoration: const InputDecoration(
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
              GestureDetector(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    Map<String, dynamic> newDonorData = {
                      "name": name,
                      "email": emailOfRequest,
                      "phone": phone,
                      "bloodType": bloodType.isEmpty ? 'A+' : bloodType,
                      "city": city.isEmpty ? 'الغربية' : city,
                      "message": message,
                    };

                    try {
                      final dio = Dio();

                      final response = await dio.post(
                        'https://blood-if5o.onrender.com/api/donor',
                        data: newDonorData,
                      );

                      if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 1),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            content: AppMessage(
                              message: '! تم ارسال الطلب ✅',
                            ),
                          ),
                        );
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    HomeScreen()));
                        log('Data posted successfully!');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 1),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            content: AppMessage(
                              message: '! تم ارسال الطلب ✅',
                            ),
                          ),
                        );
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    HomeScreen()));
                        log('Success ${response.statusCode}');
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          content: AppMessage(
                            message: 'خطأ في ارسال الطلب ❌',
                          ),
                        ),
                      );

                      log('Error: $e');
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
