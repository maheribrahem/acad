import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_categ/add_categ_widget.dart';
import '/components/add_sup/add_sup_widget.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/showactivit/showactivit_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admincourses_widget.dart' show AdmincoursesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdmincoursesModel extends FlutterFlowModel<AdmincoursesWidget> {
  ///  Local state fields for this page.

  int? mum0 = 0;

  List<DocumentReference> refList = [];
  void addToRefList(DocumentReference item) => refList.add(item);
  void removeFromRefList(DocumentReference item) => refList.remove(item);
  void removeAtIndexFromRefList(int index) => refList.removeAt(index);
  void insertAtIndexInRefList(int index, DocumentReference item) =>
      refList.insert(index, item);
  void updateRefListAtIndex(int index, Function(DocumentReference) updateFn) =>
      refList[index] = updateFn(refList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for nav0 component.
  late Nav0Model nav0Model;
  // Model for topbar component.
  late TopbarModel topbarModel;
  // Models for showactivit dynamic component.
  late FlutterFlowDynamicModels<ShowactivitModel> showactivitModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nav0Model = createModel(context, () => Nav0Model());
    topbarModel = createModel(context, () => TopbarModel());
    showactivitModels = FlutterFlowDynamicModels(() => ShowactivitModel());
  }

  void dispose() {
    unfocusNode.dispose();
    nav0Model.dispose();
    topbarModel.dispose();
    showactivitModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
