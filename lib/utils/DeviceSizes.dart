// ignore_for_file: file_names

import 'package:flutter/material.dart';

double getH(BuildContext cntx, double per) {
  return (MediaQuery.of(cntx).size.height / 100) * per;
}

double getW(BuildContext cntx, double per) {
  return (MediaQuery.of(cntx).size.width / 100) * per;
}

double getSP(BuildContext cntx, double per) {
  return per * (cntx.size!.width / 3) * 100;
}
