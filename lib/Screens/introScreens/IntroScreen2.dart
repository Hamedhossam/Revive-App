import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/Images/introTwo.jpg',
          height: MediaQuery.sizeOf(context).height * 0.35,
          width: MediaQuery.sizeOf(context).width,
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'البحث عن متبرعين',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 27,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'يحتاج ملايين الأشخاص إلى عمليات نقل دم سنويًا. قد يحتاج البعض إلى الدم أثناء خضوعهم للجراحة. ويعتمد عليه آخرون بعد تعرضهم للحوادث ',
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
