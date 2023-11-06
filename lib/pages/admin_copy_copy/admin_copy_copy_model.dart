import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_copy_copy_widget.dart' show AdminCopyCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdminCopyCopyModel extends FlutterFlowModel<AdminCopyCopyWidget> {
  ///  Local state fields for this page.

  List<GradesStruct> usersGrads = [];
  void addToUsersGrads(GradesStruct item) => usersGrads.add(item);
  void removeFromUsersGrads(GradesStruct item) => usersGrads.remove(item);
  void removeAtIndexFromUsersGrads(int index) => usersGrads.removeAt(index);
  void insertAtIndexInUsersGrads(int index, GradesStruct item) =>
      usersGrads.insert(index, item);
  void updateUsersGradsAtIndex(int index, Function(GradesStruct) updateFn) =>
      usersGrads[index] = updateFn(usersGrads[index]);

  DocumentReference? categRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topbar component.
  late TopbarModel topbarModel;
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
    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
