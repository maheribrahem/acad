import '/components/nav0/nav0_widget.dart';
import '/components/showactivit/showactivit_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admincourses_widget.dart' show AdmincoursesWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {
    nav0Model = createModel(context, () => Nav0Model());
    topbarModel = createModel(context, () => TopbarModel());
    showactivitModels = FlutterFlowDynamicModels(() => ShowactivitModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nav0Model.dispose();
    topbarModel.dispose();
    showactivitModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
