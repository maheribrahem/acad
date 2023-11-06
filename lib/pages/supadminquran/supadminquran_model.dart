import '/components/nav0/nav0_widget.dart';
import '/components/quran_create/quran_create_widget.dart';
import '/components/quranupdate/quranupdate_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'supadminquran_widget.dart' show SupadminquranWidget;
import 'package:flutter/material.dart';

class SupadminquranModel extends FlutterFlowModel<SupadminquranWidget> {
  ///  Local state fields for this page.

  DocumentReference? categRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for mentoor widget.
  FocusNode? mentoorFocusNode;
  TextEditingController? mentoorController;
  String? Function(BuildContext, String?)? mentoorControllerValidator;
  // Models for quranupdate dynamic component.
  late FlutterFlowDynamicModels<QuranupdateModel> quranupdateModels;
  // Models for quranCreate dynamic component.
  late FlutterFlowDynamicModels<QuranCreateModel> quranCreateModels;
  // Model for nav0 component.
  late Nav0Model nav0Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    quranupdateModels = FlutterFlowDynamicModels(() => QuranupdateModel());
    quranCreateModels = FlutterFlowDynamicModels(() => QuranCreateModel());
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

    quranupdateModels.dispose();
    quranCreateModels.dispose();
    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
