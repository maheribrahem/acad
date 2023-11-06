// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ignore_for_file: unused_import

import 'dart:convert' show utf8;
import 'package:download/download.dart';

Future<void> downloadCollectionAsCSV(List<UsersRecord>? docs) async {
  try {
    docs = docs ?? [];

    String fileContent =
        "email, uID, refrence, display_name, uid, created_time, phone_number, born, address, gender, fullname, state, city, school_level, job, social_status, past_study, referral, quran_juz";

    docs.asMap().forEach((index, record) => fileContent = fileContent +
        "\n" +
        record.email.toString() +
        "," +
        record.uid.toString() +
        "," +
        record.reference.toString() +
        "," +
        record.displayName.toString() +
        "," +
        record.uid.toString() +
        "," +
        record.createdTime.toString() +
        "," +
        record.phoneNumber.toString() +
        "," +
        record.born.toString() +
        "," +
        record.address.toString() +
        "," +
        record.gender.toString() +
        "," +
        record.fullname.toString() +
        "," +
        record.state.toString() +
        "," +
        record.city.toString() +
        "," +
        record.schoolLevel.toString() +
        "," +
        record.job.toString() +
        "," +
        record.socialStatus.toString() +
        "," +
        record.pastStudy.toString() +
        "," +
        record.referral.toString() +
        "," +
        record.quranJuz.toString());

    final fileName = "FF" + DateTime.now().toString() + ".csv";

    // Encode the string as a List<int> of UTF-8 bytes
    var bytes = utf8.encode(fileContent);

    final stream = Stream.fromIterable(bytes);
    return await download(stream, fileName);
  } catch (e) {
    print('Error while downloading CSV file: $e');
    throw e;
  }
}
