import 'package:blood/Screens/HomeScreen.dart';
import 'package:blood/Screens/LoginScreen.dart';
import 'package:blood/Widgets/UserArea.dart';
import 'package:blood/styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfile extends StatefulWidget {
  MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isBlocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 5,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => HomeScreen()));
                  },
                  icon: Icon(CupertinoIcons.back),
                  color: Colors.white,
                  iconSize: 35,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 65.0),
                  child: Text(
                    'الصفحة الشخصية',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height / 4.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        image: const DecorationImage(
                            image: AssetImage('assets/Images/hamedPhoto.jpeg'),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 140.0),
                      child: Row(
                        children: [
                          Text(
                            '  $userLastName ',
                            style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            userName,
                            style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'كفر الزيات (الغربية)  📌',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 22,
                        color: Color.fromARGB(255, 198, 195, 195),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'B+',
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    'فصيلة الدم ',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    'عدد التبرعات',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    'الطلبات',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        color: lightColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Switch(
                                  value: isBlocked,
                                  onChanged: (value) {
                                    setState(() {
                                      isBlocked = value;
                                    });
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      'متاح للتبرع',
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 22,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  isBlocked == true
                                      ? const Icon(
                                          Icons.online_prediction_outlined,
                                          size: 40,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.online_prediction_outlined,
                                          size: 40,
                                          color: primaryColor,
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Card(
                        color: lightColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DonationHistoryScreen()),
                                    );
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.forward,
                                    size: 30,
                                    weight: 50,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          'تاريخ التبرعات',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 22,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: Icon(
                                          Icons.history_outlined,
                                          size: 35,
                                          color: primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Card(
                        color: lightColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: IconButton(
                                  onPressed: () {
                                    sendEmailWithLibraryLink(
                                      'hamedhossamelmarasy@gmail.com',
                                      'please help me !',
                                      'I found this awesome library that you might be interested in.',
                                      'https://pub.dev/packages/url_launcher',
                                      context,
                                    );
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.forward,
                                    size: 30,
                                    weight: 50,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          'فريق الدعم',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 22,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: Icon(
                                          Icons.contact_support_outlined,
                                          size: 35,
                                          color: primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Card(
                        color: lightColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginScreen();
                                    }), (route) => false);
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.forward,
                                    size: 30,
                                    weight: 50,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          'تسجيــل الخروج',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 22,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: Icon(
                                          Icons.logout_outlined,
                                          size: 35,
                                          color: primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

Future<void> sendEmailWithLibraryLink(String recipientEmail, String subject,
    String body, String libraryUrl, context) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: recipientEmail,
    query:
        'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent('$body\n\nLibrary URL: $libraryUrl')}',
  );
  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    // Handle the case where the email app couldn't be launched
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to send email.'),
      ),
    );
  }
}

class DonationHistoryScreen extends StatelessWidget {
  const DonationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Color.fromARGB(255, 36, 129, 252),
        shadowColor: const Color.fromARGB(255, 14, 100, 170),
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 5),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.back),
                color: primaryColor,
                iconSize: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 80.0),
                child: Text(
                  'تاريخ التبرعات',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 25,
                      color: primaryColor,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/lottie/nodata.json'),
      ),
    );
  }
}
