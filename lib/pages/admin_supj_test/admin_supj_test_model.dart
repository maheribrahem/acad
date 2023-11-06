import '/components/nav0/nav0_widget.dart';
import '/components/qand_a/qand_a_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_supj_test_widget.dart' show AdminSupjTestWidget;
import 'package:flutter/material.dart';

class AdminSupjTestModel extends FlutterFlowModel<AdminSupjTestWidget> {
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

  String audio = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for nav0 component.
  late Nav0Model nav0Model;
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Models for QandA dynamic component.
  late FlutterFlowDynamicModels<QandAModel> qandAModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nav0Model = createModel(context, () => Nav0Model());
    topbarModel = createModel(context, () => TopbarModel());
    qandAModels = FlutterFlowDynamicModels(() => QandAModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nav0Model.dispose();
    topbarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    qandAModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
