import 'package:blood/styles/Colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CurvedNavigationBar(
          index: 1,
          animationDuration: Duration(milliseconds: 300),
          height: 50,
          color: primaryColor,
          backgroundColor: Colors.white,
          items: const [
            Icon(
              Icons.bloodtype_outlined,
              color: Colors.white,
              size: 40,
            ),
            Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 40,
            ),
            Icon(
              Icons.person_2_outlined,
              color: Colors.white,
              size: 40,
            ),
          ]),
    );
  }
}
