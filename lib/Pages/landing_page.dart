import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Pages/getstarted_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sliding(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
        body: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background5.jpg'), fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("News ",
                    style: GoogleFonts.acme(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .6)),
                Text(" Pulse",
                    style: GoogleFonts.acme(
                        color: Colors.red,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .6)),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          SpinKitChasingDots(
            color: Colors.black,
            size: 40,
          )
        ],
      ),
    ));
  }
}
