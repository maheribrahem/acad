import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'supadmin_users_copy4_widget.dart' show SupadminUsersCopy4Widget;
import 'package:flutter/material.dart';

class SupadminUsersCopy4Model
    extends FlutterFlowModel<SupadminUsersCopy4Widget> {
  ///  Local state fields for this page.

  int? intgerX = 0;

  int? intgerFrom = 0;

  bool isON = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for nav0 component.
  late Nav0Model nav0Model;
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

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
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
