import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/quran_create/quran_create_widget.dart';
import '/components/quranupdate/quranupdate_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'supadminquran_widget.dart' show SupadminquranWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SupadminquranModel extends FlutterFlowModel<SupadminquranWidget> {
  ///  Local state fields for this page.

  DocumentReference? categRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for mentoor widget.
  FocusNode? mentoorFocusNode;
  TextEditingController? mentoorController;
  String? Function(BuildContext, String?)? mentoorControllerValidator;
  // Models for quranupdate dynamic component.
  late FlutterFlowDynamicModels<QuranupdateModel> quranupdateModels;
  // Models for quranCreate dynamic component.
  late FlutterFlowDynamicModels<QuranCreateModel> quranCreateModels;
  // Model for nav0 component.
  late Nav0Model nav0Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    quranupdateModels = FlutterFlowDynamicModels(() => QuranupdateModel());
    quranCreateModels = FlutterFlowDynamicModels(() => QuranCreateModel());
    nav0Model = createModel(context, () => Nav0Model());
  }

  void dispose() {
    unfocusNode.dispose();
    topbarModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    mentoorFocusNode?.dispose();
    mentoorController?.dispose();

    quranupdateModels.dispose();
    quranCreateModels.dispose();
    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
