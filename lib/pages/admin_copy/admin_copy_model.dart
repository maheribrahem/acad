import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_copy_widget.dart' show AdminCopyWidget;
import 'package:flutter/material.dart';

class AdminCopyModel extends FlutterFlowModel<AdminCopyWidget> {
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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for nav0 component.
  late Nav0Model nav0Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    nav0Model = createModel(context, () => Nav0Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topbarModel.dispose();
    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
