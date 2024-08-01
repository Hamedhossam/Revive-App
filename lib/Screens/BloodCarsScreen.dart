import 'package:blood/Classes/BloodRequestModel.dart';
import 'package:blood/Classes/apis.dart';
import 'package:blood/Screens/SignUpScreen.dart';
import 'package:blood/Widgets/BloodCarWidget.dart';
import 'package:blood/Widgets/RequestBloodWidget.dart';
import 'package:blood/styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BloodCarsScreen extends StatefulWidget {
  const BloodCarsScreen({super.key});

  @override
  State<BloodCarsScreen> createState() => _BloodCarsScreenState();
}

class _BloodCarsScreenState extends State<BloodCarsScreen> {
  EgyptianGovernorate? selectedGovernorate;
  BloodType? selectedBloodType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Color.fromARGB(255, 36, 129, 252),
        shadowColor: const Color.fromARGB(255, 14, 100, 170),
        toolbarHeight: 100,
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
              Padding(
                padding: EdgeInsets.only(left: 80.0),
                child: Row(
                  children: [
                    const Text(
                      'عربات التبرع',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 25,
                          color: primaryColor,
                          fontWeight: FontWeight.w900),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height / 18,
                        width: MediaQuery.sizeOf(context).width / 8,
                        decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Image.asset(
                            'assets/Images/ambulance_2860772.png',
                            height: MediaQuery.sizeOf(context).height / 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: FutureBuilder(
          future: services().getBloodCars(),
          builder: (context, snapshot) {
            return (snapshot.data == null)
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        height: 400,
                        width: 400,
                        child: Lottie.asset(
                          'assets/lottie/searching.json',
                          height: 300,
                          width: 300,
                          repeat: true,
                        ),
                        // child: CircularProgressIndicator(
                        //   color: primaryColor,
                        //   strokeWidth: 8,
                        // ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return BloodCarsWidget(
                          bloodCarModel: snapshot.data![index]);
                    },
                  );
          },
        ),
      ),
    );
  }
}
// RequestBloodWidget(
//                           bloodRequestModel: snapshot.data![index]);