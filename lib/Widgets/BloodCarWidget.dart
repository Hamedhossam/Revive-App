import 'dart:developer';

import 'package:blood/Classes/BloodCarModel.dart';
import 'package:blood/Classes/BloodRequestModel.dart';
import 'package:blood/Screens/BloodCarViewScreen.dart';
import 'package:blood/Screens/BloodCarsScreen.dart';
import 'package:blood/styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodCarsWidget extends StatelessWidget {
  BloodCarsWidget({
    required this.bloodCarModel,
    super.key,
  });
  BloodCarModel? bloodCarModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: MediaQuery.sizeOf(context).height / 8,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 1),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(bloodCarModel!.image)),
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            bloodCarModel!.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 20,
                                color: primaryColor,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchMap(
                                'https://maps.app.goo.gl/A2Hhc9gE5CgGLSdV7');
                          },
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.location_solid,
                                color: Colors.blue,
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  bloodCarModel!.address,
                                  style: const TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 20,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              // Text(
                              //   " ، ${bloodCarModel!.city}",
                              //   style: const TextStyle(
                              //       fontFamily: 'Cairo',
                              //       fontSize: 20,
                              //       color: Colors.blue,
                              //       fontWeight: FontWeight.w900),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Bloodcarviewscreen(
                            bloodCarObject: bloodCarModel,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 70,
                  vertical: 5,
                ),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        'ارسال طلب',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
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

Future<void> launchMap(
  String url,
) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch WhatsApp';
  }
}

// Future<void> launchWhatsAppWithMessage(
//   String phoneNumber,
// ) async {
//   final url = 'https://wa.me/$phoneNumber';
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse(url));
//   } else {
//     throw 'Could not launch WhatsApp';
//   }
// }

// Future<void> launchPhoneCall(String phoneNumber) async {
//   final url = 'tel:$phoneNumber';
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse(url));
//   } else {
//     throw 'Could not launch phone app';
//   }
// }
