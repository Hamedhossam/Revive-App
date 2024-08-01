import 'package:blood/Screens/BloodCarsScreen.dart';
import 'package:blood/Screens/DonateScreen.dart';
import 'package:blood/Screens/HomeScreen.dart';
import 'package:blood/Screens/RequestBloodScreen.dart';
import 'package:blood/Screens/RequestsScreen.dart';
import 'package:blood/styles/Colors.dart';
import 'package:flutter/material.dart';

class ListOfPagesWidget extends StatelessWidget {
  const ListOfPagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 7.2,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RequestsScreen()),
                    );
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height / 10,
                    width: MediaQuery.sizeOf(context).width / 5,
                    decoration: BoxDecoration(
                        color: lightColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Image.asset(
                        'assets/Images/donate.png',
                        height: MediaQuery.sizeOf(context).height / 14,
                      ),
                    ),
                  ),
                ),
                const Text(
                  "تبرع",
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                RequestBloodScreen()));
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height / 10,
                    width: MediaQuery.sizeOf(context).width / 5,
                    decoration: BoxDecoration(
                        color: lightColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Image.asset(
                      'assets/Images/request.png',
                      height: MediaQuery.sizeOf(context).height / 12,
                    )),
                  ),
                ),
                const Text(
                  "أطلب",
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BloodCarsScreen()),
                    );
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height / 10,
                    width: MediaQuery.sizeOf(context).width / 5,
                    decoration: BoxDecoration(
                        color: lightColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Image.asset(
                      'assets/Images/placeholder_186250.png',
                      height: MediaQuery.sizeOf(context).height / 15,
                    )),
                  ),
                ),
                const Text(
                  "أماكن التبرع",
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
