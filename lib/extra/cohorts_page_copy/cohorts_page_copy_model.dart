import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cohorts_page_copy_widget.dart' show CohortsPageCopyWidget;
import 'package:flutter/material.dart';

class CohortsPageCopyModel extends FlutterFlowModel<CohortsPageCopyWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> usersToEdit = [];
  void addToUsersToEdit(DocumentReference item) => usersToEdit.add(item);
  void removeFromUsersToEdit(DocumentReference item) =>
      usersToEdit.remove(item);
  void removeAtIndexFromUsersToEdit(int index) => usersToEdit.removeAt(index);
  void insertAtIndexInUsersToEdit(int index, DocumentReference item) =>
      usersToEdit.insert(index, item);
  void updateUsersToEditAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersToEdit[index] = updateFn(usersToEdit[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
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
