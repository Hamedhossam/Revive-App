import 'package:blood/styles/Colors.dart';
import 'package:flutter/material.dart';

class AppMessage extends StatelessWidget {
  AppMessage({
    required this.message,
    super.key,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 207, 205, 205),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          message!,
          style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
