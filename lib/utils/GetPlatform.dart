// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io' show Platform;

String GetPlatform() {
  String os = "";
  if (Platform.isIOS) {
    os = "ios";
  } else if (Platform.isAndroid) {
    os = "android";
  } else if (Platform.isMacOS) {
    os = "mac";
  }

  return os;
}
