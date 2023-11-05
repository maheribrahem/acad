import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/mentors/mentors_widget.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/components/users_data/users_data_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_usesrs_widget.dart' show AdminUsesrsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdminUsesrsModel extends FlutterFlowModel<AdminUsesrsWidget> {
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

  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    nav0Model = createModel(context, () => Nav0Model());
  }

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
