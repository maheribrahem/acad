import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    String? oldV,
    this.newV,
  })  : oldV = oldV ?? '3';

  final String oldV;
  final DocumentReference? newV;

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setAppLanguage(context, 'ar');
      await Future.delayed(const Duration(milliseconds: 2500));
      if ((currentUserDisplayName != '') &&
          (currentPhoneNumber != '') &&
          (valueOrDefault(currentUserDocument?.gender, '') != '') &&
          (valueOrDefault(currentUserDocument?.fullname, '') != '') &&
          (valueOrDefault(currentUserDocument?.state, '') != '') &&
          (valueOrDefault(currentUserDocument?.city, '') != '') &&
          (valueOrDefault(currentUserDocument?.schoolLevel, '') != '') &&
          (valueOrDefault(currentUserDocument?.job, '') != '') &&
          (valueOrDefault(currentUserDocument?.socialStatus, '') != '') &&
          (valueOrDefault(currentUserDocument?.pastStudy, '') != '') &&
          (valueOrDefault(currentUserDocument?.referral, '') != '') &&
          (valueOrDefault(currentUserDocument?.quranJuz, '') != '') &&
          (valueOrDefault(currentUserDocument?.telegram, '') != '')) {
        return;
      }

      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: false,
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
              child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: const ProfilecompWidget(),
            ),
          ));
        },
      ).then((value) => safeSetState(() {}));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<VersionRecord>>(
      stream: queryVersionRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: SpinKitSquareCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 100.0,
                ),
              ),
            ),
          );
        }
        List<VersionRecord> profileVersionRecordList = snapshot.data!;
        return Title(
            title: 'profile',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                drawer: WebViewAware(
                    child: Drawer(
                  elevation: 16.0,
                  child: wrapWithModel(
                    model: _model.nav0Model,
                    updateCallback: () => setState(() {}),
                    child: const Nav0Widget(),
                  ),
                )),
                body: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.asset(
                        'assets/images/AppBackground.png',
                      ).image,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 35.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                      child: Icon(
                                        Icons.menu_open,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 50.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.topbarModel,
                                      updateCallback: () => setState(() {}),
                                      child: const TopbarWidget(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 100.0,
                                            constraints: const BoxConstraints(
                                              maxWidth: 700.0,
                                            ),
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 500.0,
                                                    child: Stack(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          32.0,
                                                                          0.0,
                                                                          30.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .shaaad,
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(16.0),
                                                                        topRight:
                                                                            Radius.circular(16.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            const Divider(
                                                                              height: 8.0,
                                                                              thickness: 4.0,
                                                                              indent: 140.0,
                                                                              endIndent: 140.0,
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '3q0ucj1k' /* ملفك الشخصي */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 10.0,
                                                                                  shape: const CircleBorder(),
                                                                                  child: Container(
                                                                                    width: 80.0,
                                                                                    height: 80.0,
                                                                                    decoration: BoxDecoration(
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4.0,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          offset: const Offset(0.0, 2.0),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: const AlignmentDirectional(0.00, 0.00),
                                                                                      child: AuthUserStreamWidget(
                                                                                        builder: (context) => StreamBuilder<UsersRecord>(
                                                                                          stream: UsersRecord.getDocument(currentUserReference!),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 100.0,
                                                                                                  height: 100.0,
                                                                                                  child: SpinKitSquareCircle(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 100.0,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final circleImageUsersRecord = snapshot.data!;
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                final selectedMedia = await selectMedia(
                                                                                                  maxWidth: 1000.00,
                                                                                                  maxHeight: 1000.00,
                                                                                                  mediaSource: MediaSource.photoGallery,
                                                                                                  multiImage: false,
                                                                                                );
                                                                                                if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                  setState(() => _model.isDataUploading = true);
                                                                                                  var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                  var downloadUrls = <String>[];
                                                                                                  try {
                                                                                                    showUploadMessage(
                                                                                                      context,
                                                                                                      'Uploading file...',
                                                                                                      showLoading: true,
                                                                                                    );
                                                                                                    selectedUploadedFiles = selectedMedia
                                                                                                        .map((m) => FFUploadedFile(
                                                                                                              name: m.storagePath.split('/').last,
                                                                                                              bytes: m.bytes,
                                                                                                              height: m.dimensions?.height,
                                                                                                              width: m.dimensions?.width,
                                                                                                              blurHash: m.blurHash,
                                                                                                            ))
                                                                                                        .toList();

                                                                                                    downloadUrls = (await Future.wait(
                                                                                                      selectedMedia.map(
                                                                                                        (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                                      ),
                                                                                                    ))
                                                                                                        .where((u) => u != null)
                                                                                                        .map((u) => u!)
                                                                                                        .toList();
                                                                                                  } finally {
                                                                                                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                    _model.isDataUploading = false;
                                                                                                  }
                                                                                                  if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                    setState(() {
                                                                                                      _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                                                                      _model.uploadedFileUrl = downloadUrls.first;
                                                                                                    });
                                                                                                    showUploadMessage(context, 'Success!');
                                                                                                  } else {
                                                                                                    setState(() {});
                                                                                                    showUploadMessage(context, 'Failed to upload data');
                                                                                                    return;
                                                                                                  }
                                                                                                }

                                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                                  photoUrl: _model.uploadedFileUrl,
                                                                                                ));
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 80.0,
                                                                                                height: 80.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: const BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: CachedNetworkImage(
                                                                                                  fadeInDuration: const Duration(milliseconds: 500),
                                                                                                  fadeOutDuration: const Duration(milliseconds: 500),
                                                                                                  imageUrl: valueOrDefault<String>(
                                                                                                    currentUserPhoto,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dark-mode-chat-xk2sj6/assets/ails754ngloi/uiAvatar@2x.png',
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        currentUserDisplayName,
                                                                                        'user name',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                            fontFamily: 'Cairo',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      currentUserEmail,
                                                                                      'email',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Cairo',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      currentPhoneNumber,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Cairo',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            AuthUserStreamWidget(
                                                                              builder: (context) => StreamBuilder<List<MentorsRecord>>(
                                                                                stream: queryMentorsRecord(
                                                                                  queryBuilder: (mentorsRecord) => mentorsRecord.where(
                                                                                    'mentoremail',
                                                                                    isEqualTo: valueOrDefault(currentUserDocument?.mentoor, ''),
                                                                                  ),
                                                                                  singleRecord: true,
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 100.0,
                                                                                        height: 100.0,
                                                                                        child: SpinKitSquareCircle(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 100.0,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<MentorsRecord> rowMentorsRecordList = snapshot.data!;
                                                                                  // Return an empty Container when the item does not exist.
                                                                                  if (snapshot.data!.isEmpty) {
                                                                                    return Container();
                                                                                  }
                                                                                  final rowMentorsRecord = rowMentorsRecordList.isNotEmpty ? rowMentorsRecordList.first : null;
                                                                                  return Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                          child: StreamBuilder<List<UsersRecord>>(
                                                                                            stream: queryUsersRecord(
                                                                                              queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                'email',
                                                                                                isEqualTo: valueOrDefault(currentUserDocument?.mentoor, '') != '' ? valueOrDefault(currentUserDocument?.mentoor, '') : null,
                                                                                              ),
                                                                                              singleRecord: true,
                                                                                            ),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 100.0,
                                                                                                    height: 100.0,
                                                                                                    child: SpinKitSquareCircle(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 100.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }
                                                                                              List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;
                                                                                              return Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 50.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(14.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 4.0,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        offset: const Offset(0.0, 2.0),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(14.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Material(
                                                                                                                color: Colors.transparent,
                                                                                                                elevation: 10.0,
                                                                                                                shape: const CircleBorder(),
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    boxShadow: [
                                                                                                                      BoxShadow(
                                                                                                                        blurRadius: 4.0,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        offset: const Offset(0.0, 2.0),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    shape: BoxShape.circle,
                                                                                                                    border: Border.all(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: InkWell(
                                                                                                                    splashColor: Colors.transparent,
                                                                                                                    focusColor: Colors.transparent,
                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                    onTap: () async {
                                                                                                                      await Navigator.push(
                                                                                                                        context,
                                                                                                                        PageTransition(
                                                                                                                          type: PageTransitionType.fade,
                                                                                                                          child: FlutterFlowExpandedImageView(
                                                                                                                            image: OctoImage(
                                                                                                                              placeholderBuilder: OctoPlaceholder.blurHash(
                                                                                                                                '.',
                                                                                                                              ),
                                                                                                                              image: NetworkImage(
                                                                                                                                containerUsersRecord.photoUrl,
                                                                                                                              ),
                                                                                                                              fit: BoxFit.contain,
                                                                                                                            ),
                                                                                                                            allowRotation: false,
                                                                                                                            tag: containerUsersRecord.photoUrl,
                                                                                                                            useHeroAnimation: true,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                    child: Hero(
                                                                                                                      tag: containerUsersRecord!.photoUrl,
                                                                                                                      transitionOnUserGestures: true,
                                                                                                                      child: ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(100.0),
                                                                                                                        child: OctoImage(
                                                                                                                          placeholderBuilder: OctoPlaceholder.blurHash(
                                                                                                                            '.',
                                                                                                                          ),
                                                                                                                          image: NetworkImage(
                                                                                                                            containerUsersRecord.photoUrl,
                                                                                                                          ),
                                                                                                                          width: 50.0,
                                                                                                                          height: 50.0,
                                                                                                                          fit: BoxFit.cover,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                '067skqg0' /* بطاقة المشرف الدراسي: */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Cairo',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              containerUsersRecord.fullname,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Cairo',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'y7japl5q' /* مشرف دراسي */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Cairo',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              containerUsersRecord.phoneNumber,
                                                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                    fontFamily: 'Cairo',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    fontSize: 15.0,
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    await launchURL(containerUsersRecord.telegram);
                                                                                                                                  },
                                                                                                                                  child: FaIcon(
                                                                                                                                    FontAwesomeIcons.telegramPlane,
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    size: 24.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    await launchUrl(Uri(
                                                                                                                                      scheme: 'tel',
                                                                                                                                      path: containerUsersRecord.phoneNumber,
                                                                                                                                    ));
                                                                                                                                    await Clipboard.setData(ClipboardData(text: containerUsersRecord.phoneNumber));
                                                                                                                                  },
                                                                                                                                  child: FaIcon(
                                                                                                                                    FontAwesomeIcons.phoneSquareAlt,
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    size: 24.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                                                child: StreamBuilder<List<ChatsRecord>>(
                                                                                                                                  stream: queryChatsRecord(
                                                                                                                                    queryBuilder: (chatsRecord) => chatsRecord
                                                                                                                                        .where(
                                                                                                                                          'user_a',
                                                                                                                                          isEqualTo: currentUserReference,
                                                                                                                                        )
                                                                                                                                        .where(
                                                                                                                                          'user_b',
                                                                                                                                          isEqualTo: containerUsersRecord.reference,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                  builder: (context, snapshot) {
                                                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                                                    if (!snapshot.hasData) {
                                                                                                                                      return Center(
                                                                                                                                        child: SizedBox(
                                                                                                                                          width: 100.0,
                                                                                                                                          height: 100.0,
                                                                                                                                          child: SpinKitSquareCircle(
                                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                                            size: 100.0,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    }
                                                                                                                                    List<ChatsRecord> iconChatsRecordList = snapshot.data!;
                                                                                                                                    return Icon(
                                                                                                                                      Icons.chat,
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      size: 24.0,
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 0.0, 16.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'msua7vj6' /* إعدادات الحساب */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Cairo',
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 60.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              offset: const Offset(0.0, 1.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(14.0),
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              'ForgotPassword',
                                                                                              extra: <String, dynamic>{
                                                                                                kTransitionInfoKey: const TransitionInfo(
                                                                                                  hasTransition: true,
                                                                                                  transitionType: PageTransitionType.bottomToTop,
                                                                                                  duration: Duration(milliseconds: 60),
                                                                                                ),
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '5hcxf8f6' /* تغيير كلمة المرور */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                              ),
                                                                                              const Expanded(
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.90, 0.00),
                                                                                                  child: Icon(
                                                                                                    Icons.arrow_forward_ios,
                                                                                                    color: Color(0xFF95A1AC),
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 60.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              offset: const Offset(0.0, 1.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(14.0),
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            context.pushNamed('profilecom');
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'xpx9oyfs' /* تعديل بياناتك الشخصية */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                              ),
                                                                                              const Expanded(
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.90, 0.00),
                                                                                                  child: Icon(
                                                                                                    Icons.arrow_forward_ios,
                                                                                                    color: Color(0xFF95A1AC),
                                                                                                    size: 18.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: 60.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              offset: const Offset(0.0, 1.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(14.0),
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await launchURL('https://t.me/+Oa-pbTL8LmRjZTY0');
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'o5e1rmid' /* اذهب للقناة العامة */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Align(
                                                                                                  alignment: const AlignmentDirectional(0.85, 0.00),
                                                                                                  child: FaIcon(
                                                                                                    FontAwesomeIcons.telegramPlane,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 40.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            FutureBuilder<int>(
                                                                              future: queryTestAttemptRecordCount(
                                                                                queryBuilder: (testAttemptRecord) => testAttemptRecord.where(
                                                                                  'userID',
                                                                                  isEqualTo: currentUserReference,
                                                                                ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 100.0,
                                                                                      height: 100.0,
                                                                                      child: SpinKitSquareCircle(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 100.0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                int rowCount = snapshot.data!;
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (rowCount >= 1)
                                                                                      Flexible(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                      child: Container(
                                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                        height: 60.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          boxShadow: [
                                                                                                            BoxShadow(
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              offset: const Offset(0.0, 1.0),
                                                                                                            )
                                                                                                          ],
                                                                                                          borderRadius: BorderRadius.circular(14.0),
                                                                                                          shape: BoxShape.rectangle,
                                                                                                        ),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await launchURL('https://t.me/+qcVC6bxytPgxN2U0');
                                                                                                          },
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    '63xgkmg1' /* اذهب للقناة العامة */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.85, 0.00),
                                                                                                                  child: FaIcon(
                                                                                                                    FontAwesomeIcons.telegramPlane,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 40.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(const SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                      child: Container(
                                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                        height: 60.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          boxShadow: [
                                                                                                            BoxShadow(
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              offset: const Offset(0.0, 1.0),
                                                                                                            )
                                                                                                          ],
                                                                                                          borderRadius: BorderRadius.circular(14.0),
                                                                                                          shape: BoxShape.rectangle,
                                                                                                        ),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            if (valueOrDefault(currentUserDocument?.gender, '') == 'ذكر') {
                                                                                                              await launchURL('https://t.me/+v9SEb47y8uwyYjk0');
                                                                                                            } else if (valueOrDefault(currentUserDocument?.gender, '') == 'male') {
                                                                                                              await launchURL('https://t.me/+v9SEb47y8uwyYjk0');
                                                                                                            } else if (valueOrDefault(currentUserDocument?.gender, '') == 'أنثى') {
                                                                                                              await launchURL('https://t.me/+ffdGeD4BftoxZTlk');
                                                                                                            } else if (valueOrDefault(currentUserDocument?.gender, '') == 'female') {
                                                                                                              await launchURL('https://t.me/+ffdGeD4BftoxZTlk');
                                                                                                            }
                                                                                                          },
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'vmkhz21f' /* اذهب للمجموعة التفاعلية */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.85, 0.00),
                                                                                                                  child: FaIcon(
                                                                                                                    FontAwesomeIcons.telegramPlane,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 40.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(const SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ),
                                                                          ].divide(const SizedBox(height: 5.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
