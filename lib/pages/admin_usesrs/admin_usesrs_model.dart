import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_usesrs_widget.dart' show AdminUsesrsWidget;
import 'package:flutter/material.dart';

class AdminUsesrsModel extends FlutterFlowModel<AdminUsesrsWidget> {
  ///  Local state fields for this page.

  int? totalUsers = 0;

  String searchString = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Algolia Search Results from action on TextField
  List<UsersRecord>? algoliaSearchResults1 = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Algolia Search Results from action on DropDown
  List<UsersRecord>? algoliaSearchResults2 = [];
  // State field(s) for mentoor widget.
  FocusNode? mentoorFocusNode;
  TextEditingController? mentoorController;
  String? Function(BuildContext, String?)? mentoorControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    mentoorFocusNode?.dispose();
    mentoorController?.dispose();

    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
