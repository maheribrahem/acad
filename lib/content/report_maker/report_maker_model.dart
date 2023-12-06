import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'report_maker_widget.dart' show ReportMakerWidget;
import 'package:flutter/material.dart';

class ReportMakerModel extends FlutterFlowModel<ReportMakerWidget> {
  ///  Local state fields for this page.

  List<SubTotalStruct> quran = [];
  void addToQuran(SubTotalStruct item) => quran.add(item);
  void removeFromQuran(SubTotalStruct item) => quran.remove(item);
  void removeAtIndexFromQuran(int index) => quran.removeAt(index);
  void insertAtIndexInQuran(int index, SubTotalStruct item) =>
      quran.insert(index, item);
  void updateQuranAtIndex(int index, Function(SubTotalStruct) updateFn) =>
      quran[index] = updateFn(quran[index]);

  List<SubTotalStruct> attend = [];
  void addToAttend(SubTotalStruct item) => attend.add(item);
  void removeFromAttend(SubTotalStruct item) => attend.remove(item);
  void removeAtIndexFromAttend(int index) => attend.removeAt(index);
  void insertAtIndexInAttend(int index, SubTotalStruct item) =>
      attend.insert(index, item);
  void updateAttendAtIndex(int index, Function(SubTotalStruct) updateFn) =>
      attend[index] = updateFn(attend[index]);

  List<SubTotalStruct> exercise = [];
  void addToExercise(SubTotalStruct item) => exercise.add(item);
  void removeFromExercise(SubTotalStruct item) => exercise.remove(item);
  void removeAtIndexFromExercise(int index) => exercise.removeAt(index);
  void insertAtIndexInExercise(int index, SubTotalStruct item) =>
      exercise.insert(index, item);
  void updateExerciseAtIndex(int index, Function(SubTotalStruct) updateFn) =>
      exercise[index] = updateFn(exercise[index]);

  List<SubTotalStruct> test = [];
  void addToTest(SubTotalStruct item) => test.add(item);
  void removeFromTest(SubTotalStruct item) => test.remove(item);
  void removeAtIndexFromTest(int index) => test.removeAt(index);
  void insertAtIndexInTest(int index, SubTotalStruct item) =>
      test.insert(index, item);
  void updateTestAtIndex(int index, Function(SubTotalStruct) updateFn) =>
      test[index] = updateFn(test[index]);

  ShowAndHideStruct? showAndHide;
  void updateShowAndHideStruct(Function(ShowAndHideStruct) updateFn) =>
      updateFn(showAndHide ??= ShowAndHideStruct());

  List<DocumentReference> testList = [];
  void addToTestList(DocumentReference item) => testList.add(item);
  void removeFromTestList(DocumentReference item) => testList.remove(item);
  void removeAtIndexFromTestList(int index) => testList.removeAt(index);
  void insertAtIndexInTestList(int index, DocumentReference item) =>
      testList.insert(index, item);
  void updateTestListAtIndex(int index, Function(DocumentReference) updateFn) =>
      testList[index] = updateFn(testList[index]);

  List<DocumentReference> exercList = [];
  void addToExercList(DocumentReference item) => exercList.add(item);
  void removeFromExercList(DocumentReference item) => exercList.remove(item);
  void removeAtIndexFromExercList(int index) => exercList.removeAt(index);
  void insertAtIndexInExercList(int index, DocumentReference item) =>
      exercList.insert(index, item);
  void updateExercListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      exercList[index] = updateFn(exercList[index]);

  List<DocumentReference> attendList = [];
  void addToAttendList(DocumentReference item) => attendList.add(item);
  void removeFromAttendList(DocumentReference item) => attendList.remove(item);
  void removeAtIndexFromAttendList(int index) => attendList.removeAt(index);
  void insertAtIndexInAttendList(int index, DocumentReference item) =>
      attendList.insert(index, item);
  void updateAttendListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      attendList[index] = updateFn(attendList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Timer widget.
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for nav0 component.
  late Nav0Model nav0Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nav0Model = createModel(context, () => Nav0Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
