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
import 'add_categ_widget.dart' show AddCategWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddCategModel extends FlutterFlowModel<AddCategWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for categName widget.
  FocusNode? categNameFocusNode1;
  TextEditingController? categNameController1;
  String? Function(BuildContext, String?)? categNameController1Validator;
  // State field(s) for categDescrip widget.
  FocusNode? categDescripFocusNode1;
  TextEditingController? categDescripController1;
  String? Function(BuildContext, String?)? categDescripController1Validator;
  // State field(s) for isSupCateg widget.
  bool? isSupCategValue1;
  // State field(s) for supCateg widget.
  String? supCategValue1;
  FormFieldController<String>? supCategValueController1;
  // State field(s) for cohortsCateg widget.
  String? cohortsCategValue1;
  FormFieldController<String>? cohortsCategValueController1;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for categName widget.
  FocusNode? categNameFocusNode2;
  TextEditingController? categNameController2;
  String? Function(BuildContext, String?)? categNameController2Validator;
  // State field(s) for categDescrip widget.
  FocusNode? categDescripFocusNode2;
  TextEditingController? categDescripController2;
  String? Function(BuildContext, String?)? categDescripController2Validator;
  // State field(s) for isSupCateg widget.
  bool? isSupCategValue2;
  // State field(s) for supCateg widget.
  String? supCategValue2;
  FormFieldController<String>? supCategValueController2;
  // State field(s) for cohortsCateg widget.
  String? cohortsCategValue2;
  FormFieldController<String>? cohortsCategValueController2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    categNameFocusNode1?.dispose();
    categNameController1?.dispose();

    categDescripFocusNode1?.dispose();
    categDescripController1?.dispose();

    categNameFocusNode2?.dispose();
    categNameController2?.dispose();

    categDescripFocusNode2?.dispose();
    categDescripController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
