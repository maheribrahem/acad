import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'searcher_widget.dart' show SearcherWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {}

  void dispose() {
    emailFocusNode?.dispose();
    emailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
