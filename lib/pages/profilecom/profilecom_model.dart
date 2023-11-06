import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profilecom_widget.dart' show ProfilecomWidget;
import 'package:flutter/material.dart';

class ProfilecomModel extends FlutterFlowModel<ProfilecomWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for topbar component.
  late TopbarModel topbarModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameController;
  String? Function(BuildContext, String?)? fullnameControllerValidator;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  // State field(s) for gender widget.
  FormFieldController<String>? genderValueController;
  DateTime? datePicked;
  // State field(s) for government widget.
  FocusNode? governmentFocusNode;
  TextEditingController? governmentController;
  String? Function(BuildContext, String?)? governmentControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for schoolname widget.
  FocusNode? schoolnameFocusNode;
  TextEditingController? schoolnameController;
  String? Function(BuildContext, String?)? schoolnameControllerValidator;
  // State field(s) for job widget.
  FocusNode? jobFocusNode;
  TextEditingController? jobController;
  String? Function(BuildContext, String?)? jobControllerValidator;
  // State field(s) for socialstatus widget.
  FormFieldController<String>? socialstatusValueController;
  // State field(s) for quran widget.
  String? quranValue;
  FormFieldController<String>? quranValueController;
  // State field(s) for referrer widget.
  FocusNode? referrerFocusNode;
  TextEditingController? referrerController;
  String? Function(BuildContext, String?)? referrerControllerValidator;
  // State field(s) for telegram widget.
  FocusNode? telegramFocusNode;
  TextEditingController? telegramController;
  String? Function(BuildContext, String?)? telegramControllerValidator;
  // Model for nav0 component.
  late Nav0Model nav0Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    nav0Model = createModel(context, () => Nav0Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topbarModel.dispose();
    fullnameFocusNode?.dispose();
    fullnameController?.dispose();

    usernameFocusNode?.dispose();
    usernameController?.dispose();

    governmentFocusNode?.dispose();
    governmentController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    schoolnameFocusNode?.dispose();
    schoolnameController?.dispose();

    jobFocusNode?.dispose();
    jobController?.dispose();

    referrerFocusNode?.dispose();
    referrerController?.dispose();

    telegramFocusNode?.dispose();
    telegramController?.dispose();

    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get genderValue => genderValueController?.value;
  String? get socialstatusValue => socialstatusValueController?.value;
}
