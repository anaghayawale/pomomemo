// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pomomemo/components/AppSpacer.dart';
import 'package:pomomemo/utils/AppColors.dart';
import 'package:pomomemo/utils/AppFunction.dart';
import 'package:pomomemo/utils/AppStyles.dart';

class TextInputComponent extends StatefulWidget {
  const TextInputComponent(
      {super.key,
      required this.controller,
      this.isEnabled = true,
      required this.hintText});

  final TextEditingController controller;
  final bool isEnabled;
  final String hintText;

  @override
  State<TextInputComponent> createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputComponent> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //----------------- EMAIL TEXTFIELD -----------------
        Container(
          height: 50,
          width: isTablet() ? screenWidth / 3 : screenWidth,
          decoration: BoxDecoration(
            color: AppColors.TEXTFIELD_BACKGROUND,
            borderRadius: BorderRadius.circular(18),
          ),
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppStyles.hintTextStyle,
              border: InputBorder.none,
              fillColor: AppColors.TEXTFIELD_BACKGROUND,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 15),
            ),
            style: AppStyles.inputTextStyle,
            enabled: widget.isEnabled,
          ),
        ),
        const AppSpacer(
          height: 10,
        ),
      ],
    );
  }
}
