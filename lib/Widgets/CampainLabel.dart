import 'package:flutter/material.dart';

class CampainLabel extends StatelessWidget {
  const CampainLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 15.0, top: 8, bottom: 15),
      child: Text(
        "حملات التبرع بالدم",
        style: TextStyle(
            fontFamily: 'Cairo', fontSize: 24, fontWeight: FontWeight.w800),
      ),
    );
  }
}
