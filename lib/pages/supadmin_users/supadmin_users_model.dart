import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'supadmin_users_widget.dart' show SupadminUsersWidget;
import 'package:flutter/material.dart';

class SupadminUsersModel extends FlutterFlowModel<SupadminUsersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for nav0 component.
  late Nav0Model nav0Model;
  // Model for topbar component.
  late TopbarModel topbarModel;
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
  // State field(s) for mentoor widget.
  FocusNode? mentoorFocusNode;
  TextEditingController? mentoorController;
  String? Function(BuildContext, String?)? mentoorControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nav0Model = createModel(context, () => Nav0Model());
    topbarModel = createModel(context, () => TopbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nav0Model.dispose();
    topbarModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    mentoorFocusNode?.dispose();
    mentoorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
