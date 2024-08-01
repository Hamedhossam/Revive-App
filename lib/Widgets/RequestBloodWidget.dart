import 'dart:developer';

import 'package:blood/Classes/BloodRequestModel.dart';
import 'package:blood/styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestBloodWidget extends StatelessWidget {
  RequestBloodWidget({
    required this.bloodRequestModel,
    super.key,
  });
  BloodRequestModel bloodRequestModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 4.5,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 2),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: (bloodRequestModel.image == null)
                              ? const NetworkImage(
                                  'https://7znn.net/wp-content/uploads/2019/08/3052-11.jpg')
                              : NetworkImage(bloodRequestModel.image!)),
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'الاسم : ',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              bloodRequestModel.name!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'رقم الهاتف : ',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              bloodRequestModel.phoneNumber!,
                              style: const TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'فصيلة الدم : ',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              bloodRequestModel.bloodType!,
                              style: const TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'المدينة : ',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              bloodRequestModel.cityName!,
                              style: const TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context, // Provide the context of your widget
                  builder: (_) {
                    return AlertDialog(
                      icon: Row(
                        children: [
                          ElevatedButton(
                              onPressed: Navigator.of(context).pop,
                              child: const Icon(Icons.close)),
                          Padding(
                            padding: const EdgeInsets.only(left: 160.0),
                            child: Image.asset(
                              'assets/Images/forum.png',
                              height: MediaQuery.sizeOf(context).height / 23,
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        'طلب تبرع بالدم',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w900),
                      ),
                      content: Column(
                        children: [
                          Container(
                            height: 180,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryColor, width: 2),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: (bloodRequestModel.image == null)
                                      ? const NetworkImage(
                                          'https://7znn.net/wp-content/uploads/2019/08/3052-11.jpg')
                                      : NetworkImage(bloodRequestModel.image!)),
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                          ),
                          Text(
                            bloodRequestModel.name!,
                            style: const TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color: primaryColor,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                " (  ${bloodRequestModel.bloodType!}  )",
                                style: const TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              const Text(
                                " : فصيلة الدم المطلوبة ",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '( ${bloodUnits.toString()} )',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                " : عدد الاكياس المطلوبة ",
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              const Text(
                                'تفاصيل أكثر',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        255, 214, 209, 209),
                                    border: Border.all(color: primaryColor)),
                                child: bloodRequestModel.message.isEmpty
                                    ? const Text(
                                        "  لا يوجد تفاصيل في هذا الطلب  ",
                                        style: const TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 20,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w900),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          bloodRequestModel.message,
                                          style: const TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 20,
                                              color: primaryColor,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              launchWhatsAppWithMessage(
                                  bloodRequestModel.phoneNumber!);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width / 1.5,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/Images/whatsapp_2504957.png',
                                          height: MediaQuery.sizeOf(context)
                                                  .height /
                                              27,
                                        ),
                                        const Text(
                                          '  مراسلة عن طريق  ',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchPhoneCall(bloodRequestModel.phoneNumber!);
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 1.5,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/Images/telephone_3771084.png',
                                        height:
                                            MediaQuery.sizeOf(context).height /
                                                27,
                                      ),
                                      const Text(
                                        '  اجراء مكالمة هاتف  ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        'عرض الطلب',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 22,
                            color: Colors.white,
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
    );
  }
}

Future<void> launchWhatsAppWithMessage(
  String phoneNumber,
) async {
  final url = 'https://wa.me/$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch WhatsApp';
  }
}

Future<void> launchPhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch phone app';
  }
}
