import '/components/nav0/nav0_widget.dart';
import '/components/qbank_answer/qbank_answer_widget.dart';
import '/components/qbank_answer_copy/qbank_answer_copy_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_content_copy_widget.dart' show TestContentCopyWidget;
import 'package:flutter/material.dart';

class TestContentCopyModel extends FlutterFlowModel<TestContentCopyWidget> {
  ///  Local state fields for this page.

  int? time = 0;

  List<int> answersIndex = [];
  void addToAnswersIndex(int item) => answersIndex.add(item);
  void removeFromAnswersIndex(int item) => answersIndex.remove(item);
  void removeAtIndexFromAnswersIndex(int index) => answersIndex.removeAt(index);
  void insertAtIndexInAnswersIndex(int index, int item) =>
      answersIndex.insert(index, item);
  void updateAnswersIndexAtIndex(int index, Function(int) updateFn) =>
      answersIndex[index] = updateFn(answersIndex[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for nav0 component.
  late Nav0Model nav0Model;
  // Model for topbar component.
  late TopbarModel topbarModel;
  // Models for QbankAnswer dynamic component.
  late FlutterFlowDynamicModels<QbankAnswerModel> qbankAnswerModels;
  // Models for QbankAnswerCopy dynamic component.
  late FlutterFlowDynamicModels<QbankAnswerCopyModel> qbankAnswerCopyModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nav0Model = createModel(context, () => Nav0Model());
    topbarModel = createModel(context, () => TopbarModel());
    qbankAnswerModels = FlutterFlowDynamicModels(() => QbankAnswerModel());
    qbankAnswerCopyModels =
        FlutterFlowDynamicModels(() => QbankAnswerCopyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nav0Model.dispose();
    topbarModel.dispose();
    qbankAnswerModels.dispose();
    qbankAnswerCopyModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
