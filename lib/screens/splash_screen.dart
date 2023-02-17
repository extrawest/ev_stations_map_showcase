import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:volkhov_maps_app/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(
            context, mapMainScreenRoute /*homeScreenRoute*/),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
