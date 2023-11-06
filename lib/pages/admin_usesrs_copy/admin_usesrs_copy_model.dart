import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_usesrs_copy_widget.dart' show AdminUsesrsCopyWidget;
import 'package:flutter/material.dart';

class AdminUsesrsCopyModel extends FlutterFlowModel<AdminUsesrsCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for mentorr widget.
  bool? mentorrValue;
  // State field(s) for comp widget.
  bool? compValue;
  // State field(s) for checked widget.
  bool? checkedValue;
  // State field(s) for real widget.
  bool? realValue;
  // State field(s) for not widget.
  bool? notValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for mentoor widget.
  FocusNode? mentoorFocusNode;
  TextEditingController? mentoorController;
  String? Function(BuildContext, String?)? mentoorControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    mentoorFocusNode?.dispose();
    mentoorController?.dispose();

    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
