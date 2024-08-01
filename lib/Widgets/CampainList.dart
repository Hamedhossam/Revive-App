import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CampainList extends StatefulWidget {
  const CampainList({
    super.key,
  });

  @override
  State<CampainList> createState() => _CampainListState();
}

class _CampainListState extends State<CampainList> {
  final url1 = Uri.parse(
      'https://www.facebook.com/p/%D9%85%D8%A4%D8%B3%D8%B3%D8%A9-%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85-%D8%A7%D9%84%D8%AE%D9%8A%D8%B1%D9%8A%D8%A9-100064573784386/');
  final url2 = Uri.parse('https://www.dar-alorman.com/');
  final url3 = Uri.parse('https://www.khairelnas.com/');
  final url4 = Uri.parse('https://mekeg.org/ar');
  final url5 = Uri.parse('https://www.egyptianrc.org/Arabic/home');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    width: 250,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        image: DecorationImage(
                            image: AssetImage('assets/Images/Salam.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Row(
                    children: [
                      const Text(
                        "مؤسسة السلام الخيرية      ",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launchUrl(url1,
                                mode: LaunchMode.externalApplication);
                          });
                        },
                        child: Icon(
                          Icons.open_in_new,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 160,
                    width: 250,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage('assets/Images/orman.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Row(
                    children: [
                      const Text(
                        "جمعية الاورمان الخيرية   ",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launchUrl(url2,
                                mode: LaunchMode.externalApplication);
                          });
                        },
                        child: Icon(
                          Icons.open_in_new,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 160,
                    width: 250,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage('assets/Images/nagah.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Row(
                    children: [
                      Text(
                        "مؤسسة النجاح الوطني   ",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launchUrl(url3,
                                mode: LaunchMode.externalApplication);
                          });
                        },
                        child: Icon(
                          Icons.open_in_new,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 160,
                    width: 250,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage('assets/Images/lntabar3.jpeg'),
                            fit: BoxFit.fill)),
                  ),
                  Row(
                    children: [
                      Text(
                        "مؤسسة لنتبرع الخيرية     ",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launchUrl(url4,
                                mode: LaunchMode.externalApplication);
                          });
                        },
                        child: Icon(
                          Icons.open_in_new,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 160,
                    width: 250,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage('assets/Images/helal.png'),
                            fit: BoxFit.fill)),
                  ),
                  Row(
                    children: [
                      const Text(
                        "مؤسسة الهلال الأحمر    ",
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            launchUrl(url5,
                                mode: LaunchMode.externalApplication);
                          });
                        },
                        child: Icon(
                          Icons.open_in_new,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
