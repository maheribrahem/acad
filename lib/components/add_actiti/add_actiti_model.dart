import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_actiti_widget.dart' show AddActitiWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddActitiModel extends FlutterFlowModel<AddActitiWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for supjName widget.
  FocusNode? supjNameFocusNode1;
  TextEditingController? supjNameController1;
  String? Function(BuildContext, String?)? supjNameController1Validator;
  // State field(s) for addlesson widget.
  FocusNode? addlessonFocusNode1;
  TextEditingController? addlessonController1;
  String? Function(BuildContext, String?)? addlessonController1Validator;
  // State field(s) for addlesson widget.
  FocusNode? addlessonFocusNode2;
  TextEditingController? addlessonController2;
  String? Function(BuildContext, String?)? addlessonController2Validator;
  // State field(s) for addlesson widget.
  FocusNode? addlessonFocusNode3;
  TextEditingController? addlessonController3;
  String? Function(BuildContext, String?)? addlessonController3Validator;
  // State field(s) for supjName widget.
  FocusNode? supjNameFocusNode2;
  TextEditingController? supjNameController2;
  String? Function(BuildContext, String?)? supjNameController2Validator;
  // State field(s) for addlesson widget.
  FocusNode? addlessonFocusNode4;
  TextEditingController? addlessonController4;
  String? Function(BuildContext, String?)? addlessonController4Validator;
  // State field(s) for addlesson widget.
  FocusNode? addlessonFocusNode5;
  TextEditingController? addlessonController5;
  String? Function(BuildContext, String?)? addlessonController5Validator;
  // State field(s) for addlesson widget.
  FocusNode? addlessonFocusNode6;
  TextEditingController? addlessonController6;
  String? Function(BuildContext, String?)? addlessonController6Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    supjNameFocusNode1?.dispose();
    supjNameController1?.dispose();

    addlessonFocusNode1?.dispose();
    addlessonController1?.dispose();

    addlessonFocusNode2?.dispose();
    addlessonController2?.dispose();

    addlessonFocusNode3?.dispose();
    addlessonController3?.dispose();

    supjNameFocusNode2?.dispose();
    supjNameController2?.dispose();

    addlessonFocusNode4?.dispose();
    addlessonController4?.dispose();

    addlessonFocusNode5?.dispose();
    addlessonController5?.dispose();

    addlessonFocusNode6?.dispose();
    addlessonController6?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
