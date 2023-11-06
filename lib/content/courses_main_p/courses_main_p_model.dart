import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'courses_main_p_widget.dart' show CoursesMainPWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    nav0Model = createModel(context, () => Nav0Model());
  }

  @override
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
