import 'dart:developer';

import 'package:blood/styles/Colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserArea extends StatelessWidget {
  const UserArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 70.0),
                        child: IconButton(
                          icon: const Icon(Icons.notifications_active_outlined),
                          color: Colors.white,
                          iconSize: 35,
                          onPressed: () {},
                        ),
                      ),
                      userName.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                userName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Cairo'),
                              ),
                            )
                          : const Text(
                              '(اســم المستخدم)',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Cairo'),
                            ),
                      const Text(
                        ' مرحــبا ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Cairo'),
                      ),
                    ],
                  ),
                  const Text(
                    ' تبرعك بالدم يساوي حياة شخص ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Container(
                height: 90,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  image: const DecorationImage(
                      image: AssetImage('assets/Images/hamedPhoto.jpeg'),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
