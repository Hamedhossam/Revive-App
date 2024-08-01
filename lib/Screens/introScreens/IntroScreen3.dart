import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/Images/introThree.jpg',
          height: MediaQuery.sizeOf(context).height * 0.35,
          width: MediaQuery.sizeOf(context).width,
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'ساعدنا في تغطية المنطقة  ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 27, fontWeight: FontWeight.w600, fontFamily: 'Cairo'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'انضم إلينا في مهمتنا من خلال البحث عن متبرع أو كن متبرعًا لمؤسسة طبية / مريض يحتاج الى تبرعك ',
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
