import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'supadmin_grading_widget.dart' show SupadminGradingWidget;
import 'package:flutter/material.dart';

class SupadminGradingModel extends FlutterFlowModel<SupadminGradingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topbar component.
  late TopbarModel topbarModel;
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
    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}