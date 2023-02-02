import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klik_ustadz/home_page.dart';
import 'package:klik_ustadz/styles/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: _buildTheme(Brightness.light),
        home: const HomePage(),
      );
    });
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);


  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  // Splash Screen timer
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 4), () {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => const HomePage(),
  //     ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customGreen,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Expanded(
              flex: 6,
              child: SizedBox(
                  height: 180,
                  width: 180,
                  child: Image.asset(
                    'images/logo.png',
                  ))),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LoadingAnimationWidget.discreteCircle(
                      color: Colors.white, size: 40),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Text(
              'Made by \nClaudio Hans Figo using Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      )),
    );
  }
}
