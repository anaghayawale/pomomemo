// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppSpacer extends StatelessWidget {
  const AppSpacer(
      {super.key,
      this.height = 0.0,
      this.width = 0.0,
      this.color = Colors.transparent});
// MediaQuery.of(context).size.width
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
