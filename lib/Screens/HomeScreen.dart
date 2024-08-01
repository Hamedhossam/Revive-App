import 'package:blood/Screens/MyProfile.dart';
import 'package:blood/Screens/RequestBloodScreen.dart';
import 'package:blood/Widgets/AdvertisingCards.dart';
import 'package:blood/Widgets/CampainLabel.dart';
import 'package:blood/Widgets/CampainList.dart';
import 'package:blood/Widgets/ListOfPages.dart';
import 'package:blood/Widgets/NavBar.dart';
import 'package:blood/Widgets/UserArea.dart';
import 'package:blood/styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [
    HomeScreenView(),
    const RequestBloodScreen(),
    MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 6, 45, 77)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.house_fill,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30,
                        ),
                      ),
                    )
                  : const Icon(
                      CupertinoIcons.house,
                      color: Colors.white,
                      size: 30,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 6, 45, 77)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Icon(
                            Icons.bloodtype_rounded,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.bloodtype_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 6, 45, 77)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.person_alt_circle_fill,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30,
                        ),
                      ),
                    )
                  : const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: Colors.white,
                      size: 30,
                    ),
            ),
          ],
        ),
      ),
      backgroundColor: primaryColor,
      body: pages[pageIndex],
    );
  }
}

class HomeScreenView extends StatelessWidget {
  HomeScreenView({
    super.key,
  });

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserArea(),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AdvertisingCardsWidget(controller: _controller),
                const ListOfPagesWidget(),
                const CampainLabel(),
                const CampainList()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
