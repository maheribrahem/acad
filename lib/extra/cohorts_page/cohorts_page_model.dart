import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cohorts_page_widget.dart' show CohortsPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CohortsPageModel extends FlutterFlowModel<CohortsPageWidget> {
  ///  Local state fields for this page.

  List<UsersRow> usersToEdit = [];
  void addToUsersToEdit(UsersRow item) => usersToEdit.add(item);
  void removeFromUsersToEdit(UsersRow item) => usersToEdit.remove(item);
  void removeAtIndexFromUsersToEdit(int index) => usersToEdit.removeAt(index);
  void insertAtIndexInUsersToEdit(int index, UsersRow item) =>
      usersToEdit.insert(index, item);
  void updateUsersToEditAtIndex(int index, Function(UsersRow) updateFn) =>
      usersToEdit[index] = updateFn(usersToEdit[index]);

  int? intX = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for cohortsName widget.
  FocusNode? cohortsNameFocusNode;
  TextEditingController? cohortsNameController;
  String? Function(BuildContext, String?)? cohortsNameControllerValidator;
  // State field(s) for Checkbox widget.

  Map<UsersRow, bool> checkboxValueMap1 = {};
  List<UsersRow> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for cohortsUser widget.
  FocusNode? cohortsUserFocusNode;
  TextEditingController? cohortsUserController;
  String? Function(BuildContext, String?)? cohortsUserControllerValidator;
  // State field(s) for Checkbox widget.

  Map<String, bool> checkboxValueMap2 = {};
  List<String> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<String, bool> checkboxValueMap3 = {};
  List<String> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for users1 widget.
  FocusNode? users1FocusNode;
  TextEditingController? users1Controller;
  String? Function(BuildContext, String?)? users1ControllerValidator;
  Completer<List<UsersRow>>? requestCompleter;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    cohortsNameFocusNode?.dispose();
    cohortsNameController?.dispose();

    cohortsUserFocusNode?.dispose();
    cohortsUserController?.dispose();

    users1FocusNode?.dispose();
    users1Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
