// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pomomemo/components/AppSpacer.dart';
import 'package:pomomemo/utils/AppColors.dart';
import 'package:pomomemo/utils/AppFunction.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_1,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //----------------- Logo -----------------
            // Image.asset(
            //   Assets.LOGO,
            //   height: 90,
            // ),
            const AppSpacer(
              height: 10,
            ),
            //----------------- Welcome Text -----------------
            const Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const AppSpacer(
              height: 5,
            ),
            //----------------- Sign in to continue Text -----------------
            Text(
              "Sign in to continue",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.COLOR_PINK),
            ),
            Container(
              width: isTablet()
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //----------------- EMAIL TEXTFIELD -----------------
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
