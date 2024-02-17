// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'dart:developer';

import 'package:flutter/material.dart';

RegExp numReg = RegExp(r".*[0-9].*");
RegExp letterReg = RegExp(r".*[A-Za-z].*");

String firstLetterCapitalize(String text) {
  return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
}

String getFileExtension(String fileName) {
  try {
    return ".${fileName.split('.').last}";
  } catch (e) {
    return "";
  }
}

bool validateMobileNo(String number) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(number);
}

bool validateEmail(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

double checkPasswordStrength(String value) {
  String password = value.trim();

  if (password.isEmpty) {
    return 0;
  } else if (password.length < 6) {
    return 1 / 4;
  } else if (password.length < 8) {
    return 2 / 4;
  } else {
    if (!letterReg.hasMatch(password) || !numReg.hasMatch(password)) {
      // Password length >= 8
      // But doesn't contain both letter and digit characters
      return 3 / 4;
    } else {
      // Password length >= 8
      // Password contains both letter and digit characters
      return 1;
    }
  }
}

bool validatePassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*,~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

bool isTablet() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 550 ? false : true;
}

bool validateUrl(String value) {
  String pattern =
      r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

//Check this date is Sunday
bool isSunday(DateTime date) {
  return date.weekday == DateTime.sunday;
}

//Check this date is Saturday
bool isSaturday(DateTime date) {
  return date.weekday == DateTime.saturday;
}

// Check this date is Thursday
bool isThursday(DateTime date) {
  return date.weekday == DateTime.thursday;
}

// Check this date is first Saturday
bool isFirstSaturday(DateTime date) {
  return date.weekday == DateTime.saturday && date.day <= 7;
}

// Check this date is second Saturday ....Temporarily not in use
bool isSecondSaturday(DateTime date) {
  return date.weekday == DateTime.saturday && date.day > 7 && date.day <= 14;
}

// Check this date is third Saturday
bool isThirdSaturday(DateTime date) {
  return date.weekday == DateTime.saturday && date.day > 14 && date.day <= 21;
}

// Check this date is fourth Saturday ....Temporarily not in use
bool isFourthSaturday(DateTime date) {
  return date.weekday == DateTime.saturday && date.day > 21;
}

//Check this date is fifth Saturday
bool isFifthSaturday(DateTime date) {
  return date.weekday == DateTime.saturday && date.day > 28;
}

// Check if the date is the 2nd, 4th, or 6th Saturday
bool isSecondOrFourthOrSixthSaturday(DateTime date) {
  return date.weekday == DateTime.saturday &&
      (date.day >= 8 && date.day <= 14 ||
          date.day >= 22 && date.day <= 28 ||
          date.day >= 36 && date.day <= 42);
}

// Check this date is last Saturday of the month
bool isLastSaturdayOfMonth(DateTime date) {
  DateTime nextMonth = DateTime(date.year, date.month + 1, 1);
  DateTime lastSaturday =
      nextMonth.subtract(Duration(days: nextMonth.weekday + 1));
  return date.month == nextMonth.subtract(const Duration(days: 1)).month &&
      date.weekday == DateTime.saturday &&
      date.day > lastSaturday.day - 7;
}

bool isSameDates(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}



 
int daysBetweenDifference(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

// /// Returns the difference (in full days) between the provided date and today.
int calculateDifferenceFromToday(DateTime date) {
  DateTime now = DateTime.now();
  log(DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays
      .toString());
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}

// checkResponseErrors(error) {
//   if (error.contains("TimeoutException")) {
//     showToastWidget(
//       warningToastWidget("Timeout, please try again."),
//       position: ToastPosition.bottom,
//       duration: const Duration(seconds: 3),
//     );
//   }
// }

getTextScaleFactor() {
  return 1.0;
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

double fontSize(double size) {
  if (size == 13) {
    if (isTablet()) {
      return 18;
    } else {
      return 13;
    }
  } else {
    return size;
  }
}
