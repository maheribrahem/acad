import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/lesson_decrip/lesson_decrip_widget.dart';
import '/components/lesson_name/lesson_name_widget.dart';
import '/components/lesson_order/lesson_order_widget.dart';
import '/components/lesson_time/lesson_time_widget.dart';
import '/components/lesson_youtube/lesson_youtube_widget.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'admin_supj_widget.dart' show AdminSupjWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdminSupjModel extends FlutterFlowModel<AdminSupjWidget> {
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
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for supjName widget.
  FocusNode? supjNameFocusNode;
  TextEditingController? supjNameController;
  String? Function(BuildContext, String?)? supjNameControllerValidator;
  // State field(s) for supjTeatcher widget.
  FocusNode? supjTeatcherFocusNode;
  TextEditingController? supjTeatcherController;
  String? Function(BuildContext, String?)? supjTeatcherControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for lessonOrder dynamic component.
  late FlutterFlowDynamicModels<LessonOrderModel> lessonOrderModels;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for docName widget.
  FocusNode? docNameFocusNode;
  TextEditingController? docNameController;
  String? Function(BuildContext, String?)? docNameControllerValidator;
  // State field(s) for docType widget.
  FocusNode? docTypeFocusNode;
  TextEditingController? docTypeController;
  String? Function(BuildContext, String?)? docTypeControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for nav0 component.
  late Nav0Model nav0Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    lessonOrderModels = FlutterFlowDynamicModels(() => LessonOrderModel());
    nav0Model = createModel(context, () => Nav0Model());
  }

  void dispose() {
    unfocusNode.dispose();
    topbarModel.dispose();
    supjNameFocusNode?.dispose();
    supjNameController?.dispose();

    supjTeatcherFocusNode?.dispose();
    supjTeatcherController?.dispose();

    tabBarController?.dispose();
    lessonOrderModels.dispose();
    docNameFocusNode?.dispose();
    docNameController?.dispose();

    docTypeFocusNode?.dispose();
    docTypeController?.dispose();

    nav0Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
