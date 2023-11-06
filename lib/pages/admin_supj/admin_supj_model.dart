import '/components/lesson_order/lesson_order_widget.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_supj_widget.dart' show AdminSupjWidget;
import 'package:flutter/material.dart';

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

  @override
  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    lessonOrderModels = FlutterFlowDynamicModels(() => LessonOrderModel());
    nav0Model = createModel(context, () => Nav0Model());
  }

  @override
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
