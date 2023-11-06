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

Future<void> downloadProgresss(List<ActivitiesProgressRecord>? docs) async {
  try {
    docs = docs ?? [];

    String fileContent =
        "reference,activitID,isDone,user,when,isSeen,isAttended,supjID,type,grade,isFinal,categRef";
    docs.asMap().forEach((index, record) => fileContent = fileContent +
        "\n" +
        record.reference.toString() +
        "," +
        record.activitID.toString() +
        "," +
        record.isDone.toString() +
        "," +
        record.user.toString() +
        "," +
        record.when.toString() +
        "," +
        record.isSeen.toString() +
        "," +
        record.isAttended.toString() +
        "," +
        record.supjID.toString() +
        "," +
        record.type.toString() +
        "," +
        record.grade.toString() +
        "," +
        record.isFinal.toString() +
        "," +
        record.categRef.toString());

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
