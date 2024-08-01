import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/Images/introOne.png',
          height: MediaQuery.sizeOf(context).height * 0.35,
          width: MediaQuery.sizeOf(context).width,
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'تبرعك بالدم قد ينقذ حياة شخص ما',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 27, fontWeight: FontWeight.w900, fontFamily: 'Cairo'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'التبرع بالدم يساعد في إنقاذ مليون شخص كل عام، لأن هذا التبرع يشمل أيضًا الصفائح الدموية والبلازما وحتى دم المشيمة',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 129, 128, 128),
              fontSize: 20,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ],
    );
  }
}
