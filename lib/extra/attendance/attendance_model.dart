import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'attendance_widget.dart' show AttendanceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AttendanceModel extends FlutterFlowModel<AttendanceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap1 = {};
  List<AttendanceRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap2 = {};
  List<AttendanceRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap3 = {};
  List<AttendanceRecord> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap4 = {};
  List<AttendanceRecord> get checkboxCheckedItems4 => checkboxValueMap4.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap5 = {};
  List<AttendanceRecord> get checkboxCheckedItems5 => checkboxValueMap5.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap6 = {};
  List<AttendanceRecord> get checkboxCheckedItems6 => checkboxValueMap6.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap7 = {};
  List<AttendanceRecord> get checkboxCheckedItems7 => checkboxValueMap7.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap8 = {};
  List<AttendanceRecord> get checkboxCheckedItems8 => checkboxValueMap8.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap9 = {};
  List<AttendanceRecord> get checkboxCheckedItems9 => checkboxValueMap9.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap10 = {};
  List<AttendanceRecord> get checkboxCheckedItems10 =>
      checkboxValueMap10.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap11 = {};
  List<AttendanceRecord> get checkboxCheckedItems11 =>
      checkboxValueMap11.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap12 = {};
  List<AttendanceRecord> get checkboxCheckedItems12 =>
      checkboxValueMap12.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap13 = {};
  List<AttendanceRecord> get checkboxCheckedItems13 =>
      checkboxValueMap13.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap14 = {};
  List<AttendanceRecord> get checkboxCheckedItems14 =>
      checkboxValueMap14.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap15 = {};
  List<AttendanceRecord> get checkboxCheckedItems15 =>
      checkboxValueMap15.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<AttendanceRecord, bool> checkboxValueMap16 = {};
  List<AttendanceRecord> get checkboxCheckedItems16 =>
      checkboxValueMap16.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
