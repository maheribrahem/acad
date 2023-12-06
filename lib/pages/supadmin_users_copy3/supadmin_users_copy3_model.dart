import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'supadmin_users_copy3_widget.dart' show SupadminUsersCopy3Widget;
import 'package:flutter/material.dart';

class SupadminUsersCopy3Model
    extends FlutterFlowModel<SupadminUsersCopy3Widget> {
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
  Completer<List<UsersRecord>>? algoliaRequestCompleter;

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

  Future waitForAlgoliaRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
