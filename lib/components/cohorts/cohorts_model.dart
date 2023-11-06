import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cohorts_widget.dart' show CohortsWidget;
import 'package:flutter/material.dart';

class CohortsModel extends FlutterFlowModel<CohortsWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> users = [];
  void addToUsers(DocumentReference item) => users.add(item);
  void removeFromUsers(DocumentReference item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, DocumentReference item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(DocumentReference) updateFn) =>
      users[index] = updateFn(users[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for cohortsName widget.
  FocusNode? cohortsNameFocusNode;
  TextEditingController? cohortsNameController;
  String? Function(BuildContext, String?)? cohortsNameControllerValidator;
  // State field(s) for Checkbox widget.

  Map<UsersRecord, bool> checkboxValueMap1 = {};
  List<UsersRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for cohortsUser widget.
  FocusNode? cohortsUserFocusNode;
  TextEditingController? cohortsUserController;
  String? Function(BuildContext, String?)? cohortsUserControllerValidator;
  // State field(s) for Checkbox widget.

  Map<UsersRecord, bool> checkboxValueMap2 = {};
  List<UsersRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for users widget.
  FocusNode? usersFocusNode;
  TextEditingController? usersController;
  String? Function(BuildContext, String?)? usersControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cohortsNameFocusNode?.dispose();
    cohortsNameController?.dispose();

    cohortsUserFocusNode?.dispose();
    cohortsUserController?.dispose();

    usersFocusNode?.dispose();
    usersController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
