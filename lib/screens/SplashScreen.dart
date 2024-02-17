// ignore_for_file: use_build_context_synchronously, file_names, deprecated_member_use

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pomomemo/screens/Dashboard.dart';
import 'package:pomomemo/screens/Login.dart';
import 'package:pomomemo/utils/AppAssets.dart';
import 'package:pomomemo/utils/AppColors.dart';
import 'package:pomomemo/utils/Constants.dart';
import 'package:pomomemo/utils/GetPlatform.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool startAnimation = false;
  String appVersion = "";
  PackageInfo? packageInfo;
  double screenHeight = 0;

  @override
  void initState() {
    super.initState();
    getPackageDetails(); // Fetch package information when the screen initializes
    Timer(const Duration(seconds: 1), () {
      setState(() {
        startAnimation = true; // Start the animation after 1 second
      });
    });
    Timer(const Duration(seconds: 4), () => onSplashScreenLoaded()); // Load the next screen after 4 seconds
  }

  // Fetch package information
  Future<void> getPackageDetails() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  // Handle the logic after the splash screen is loaded
  Future<void> onSplashScreenLoaded() async {
    // Log package version for debugging purposes
    log(
      "version--------------------------------${packageInfo!.version}",
    );

    // Check the platform to determine the flow
    if (GetPlatform() == "ios") {
      final pref = await SharedPreferences.getInstance();

      // Check if it's the first run of the app
      if (pref.getBool('first_run') ?? true) {
        // If it's the first run, clear any stored data and navigate to the login screen
        FlutterSecureStorage storage = const FlutterSecureStorage();
        await storage.deleteAll();
        pref.setBool('first_run', false);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => false);
      } else {
        // If not the first run, check if the user is already logged in
        const storage = FlutterSecureStorage();
        String? token = await storage.read(key: Constants.loginUserToken);

        // If the token exists, navigate to the dashboard, otherwise navigate to the login screen
        if (token != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
              (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false);
        }
      }
    } else {
      // For platforms other than iOS (e.g., Android), follow the same logic as above
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: Constants.loginUserToken);

      if (token != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_1,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // Animated logo with conditional width and height
                  AnimatedPositioned(
                    width: startAnimation ? 200.0 : 0,
                    height: startAnimation ? 200.0 : 0,
                    bottom: startAnimation ? screenHeight / 2.5 : 0,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: Image.asset(
                      Assets.LOGO,
                      height: 130,
                    ),
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
