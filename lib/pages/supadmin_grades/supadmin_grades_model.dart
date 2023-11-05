import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'supadmin_grades_widget.dart' show SupadminGradesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SupadminGradesModel extends FlutterFlowModel<SupadminGradesWidget> {
  ///  Local state fields for this page.

  bool list = false;

  int? listNum = 10;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDownNames widget.
  String? dropDownNamesValue;
  FormFieldController<String>? dropDownNamesValueController;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UsersRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // Model for nav0 component.
  late Nav0Model nav0Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    nav0Model = createModel(context, () => Nav0Model());
  }

  void dispose() {
    unfocusNode.dispose();
    topbarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, UsersRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, UsersRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UsersRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUsersRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
