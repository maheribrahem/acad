import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'searcher_widget.dart' show SearcherWidget;
import 'package:flutter/material.dart';

class SearcherModel extends FlutterFlowModel<SearcherWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<List<String>>? genderValueController;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for mento widget.
  String? mentoValue;
  FormFieldController<String>? mentoValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
