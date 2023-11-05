import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'add_sup_widget.dart' show AddSupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSupModel extends FlutterFlowModel<AddSupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for supjName widget.
  FocusNode? supjNameFocusNode1;
  TextEditingController? supjNameController1;
  String? Function(BuildContext, String?)? supjNameController1Validator;
  // State field(s) for supjDiscrip widget.
  FocusNode? supjDiscripFocusNode1;
  TextEditingController? supjDiscripController1;
  String? Function(BuildContext, String?)? supjDiscripController1Validator;
  // State field(s) for supjDiscrip widget.
  FocusNode? supjDiscripFocusNode2;
  TextEditingController? supjDiscripController2;
  String? Function(BuildContext, String?)? supjDiscripController2Validator;
  // State field(s) for cohortsCategSupj widget.
  String? cohortsCategSupjValue1;
  FormFieldController<String>? cohortsCategSupjValueController1;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for supjName widget.
  FocusNode? supjNameFocusNode2;
  TextEditingController? supjNameController2;
  String? Function(BuildContext, String?)? supjNameController2Validator;
  // State field(s) for supjDiscrip widget.
  FocusNode? supjDiscripFocusNode3;
  TextEditingController? supjDiscripController3;
  String? Function(BuildContext, String?)? supjDiscripController3Validator;
  // State field(s) for supjDiscrip widget.
  FocusNode? supjDiscripFocusNode4;
  TextEditingController? supjDiscripController4;
  String? Function(BuildContext, String?)? supjDiscripController4Validator;
  // State field(s) for cohortsCategSupj widget.
  String? cohortsCategSupjValue2;
  FormFieldController<String>? cohortsCategSupjValueController2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    supjNameFocusNode1?.dispose();
    supjNameController1?.dispose();

    supjDiscripFocusNode1?.dispose();
    supjDiscripController1?.dispose();

    supjDiscripFocusNode2?.dispose();
    supjDiscripController2?.dispose();

    supjNameFocusNode2?.dispose();
    supjNameController2?.dispose();

    supjDiscripFocusNode3?.dispose();
    supjDiscripController3?.dispose();

    supjDiscripFocusNode4?.dispose();
    supjDiscripController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
