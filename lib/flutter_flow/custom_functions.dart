import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? searching(
  String searchFore,
  String searchIN,
) {
  return searchFore.contains(searchIN);
}

int? decrementOrder(int? order) {
  return order! - 1;
}

double? attendanceGradeCopy(
  double? total,
  double? tests,
) {
  double? grade = ((tests!)) / total!;
  print(grade);
  if (grade > 1) {
    return 1;
  } else {
    return grade;
  }
}

int? incrementOrder(int? order) {
  return order! + 1;
}

int? booleanCount(List<bool>? boolList) {
  return boolList?.where((element) => element == true).length;
}

double? attend(
  double? bigNum,
  double? smallNum,
) {
  return bigNum! / smallNum!;
}

List<String>? parseEmails(String? emailsText) {
  if (emailsText == null || emailsText.isEmpty) {
    return [];
  }

  List<String> emails =
      emailsText.split(',').map((email) => email.trim()).toList();
  return emails;
}

double? sumList(List<double>? numList) {
  List<double>? numbers = numList;
  double? sum = numbers?.reduce((value, element) => value + element);
  print(sum);
  return sum; // Prints the sum of the numbers: 15
}

double? attendanceGrade(
  double? total,
  double? seen,
  double? attend,
) {
  double? grade = ((seen! * 1) + (attend! * .5)) / total!;
  print(grade);
  if (grade > 1) {
    return 1;
  } else {
    return grade;
  }
}

List<String>? stringToListFunction(String? stringInput) {
  List<String> resultList = stringInput!.split(',');
  return resultList.map((item) => item.toLowerCase()).toSet().toList();
}

List<String>? filterList(
  List<String>? listN1,
  List<String>? listN2,
) {
  if (listN1 == null || listN2 == null) return null;

  // Use a Set for faster lookup
  Set<String> setN2 = listN2.map((item) => item.toLowerCase()).toSet();

  // Filter listN1 based on items in setN2 and convert to lowercase
  List<String> filteredList = listN1
      .map((item) => item.toLowerCase())
      .where((item) => setN2.contains(item))
      .toSet()
      .toList();

  return filteredList;
}
