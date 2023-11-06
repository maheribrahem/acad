import '/components/qoptions/qoptions_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'qand_a_widget.dart' show QandAWidget;
import 'package:flutter/material.dart';

class QandAModel extends FlutterFlowModel<QandAWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Models for Qoptions dynamic component.
  late FlutterFlowDynamicModels<QoptionsModel> qoptionsModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    qoptionsModels = FlutterFlowDynamicModels(() => QoptionsModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    qoptionsModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
