import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'courses_main_p_widget.dart' show CoursesMainPWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CoursesMainPModel extends FlutterFlowModel<CoursesMainPWidget> {
  ///  Local state fields for this page.

  DocumentReference? categRef;

  DocumentReference? supjRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for categRef widget.
  FocusNode? categRefFocusNode;
  TextEditingController? categRefController;
  String? Function(BuildContext, String?)? categRefControllerValidator;
  // State field(s) for supjRef widget.
  FocusNode? supjRefFocusNode;
  TextEditingController? supjRefController;
  String? Function(BuildContext, String?)? supjRefControllerValidator;
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
    categRefFocusNode?.dispose();
    categRefController?.dispose();

    supjRefFocusNode?.dispose();
    supjRefController?.dispose();

    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
