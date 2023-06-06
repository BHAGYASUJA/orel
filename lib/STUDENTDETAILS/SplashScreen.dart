import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../STUDENTDETAILS/ClassDetails/loginPage.dart';

void main() {
  runApp( SplashScreen());
}
class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blueGrey,
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.easeInOutBack,
          duration: const Duration(milliseconds: 1500),
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          builder: (context, val, child) => Material(
            color: Colors.white30,
            elevation: 0,
            borderRadius: BorderRadius.circular(500),
            child:
              Lottie.network('https://iconscout.com/lottie/graduate-8487769',
                frameRate: FrameRate(60),),
            // Lottie.asset(
            //   Images.splashAnim,
            //   frameRate: FrameRate(60),
            //   width: context.percentWidth * (double.parse(val.toString()) * 55),
            // ),
          ),
        ),
      ),

    );
  }
}
