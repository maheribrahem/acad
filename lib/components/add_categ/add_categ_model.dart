import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_categ_widget.dart' show AddCategWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
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
