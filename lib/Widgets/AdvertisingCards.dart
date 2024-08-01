import 'package:blood/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdvertisingCardsWidget extends StatelessWidget {
  const AdvertisingCardsWidget({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 4,
          width: MediaQuery.sizeOf(context).width,
          child: PageView(
            controller: _controller,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 5),
                child: Container(
                  height: MediaQuery.sizeOf(context).height / 8,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/Images/card1.jpg')),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/Images/card2.jpg')),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/Images/card3.jpg')),
                      borderRadius: BorderRadius.circular(30)),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const SlideEffect(
                spacing: 7.0,
                radius: 16.0,
                dotWidth: 15.0,
                dotHeight: 15.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 3,
                dotColor: Colors.grey,
                activeDotColor: primaryColor),
          ),
        ),
      ],
    );
  }
}
