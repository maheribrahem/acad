import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'mentor_model.dart';
export 'mentor_model.dart';

class MentorWidget extends StatefulWidget {
  const MentorWidget({
    Key? key,
    this.output,
  }) : super(key: key);

  final bool? output;

  @override
  _MentorWidgetState createState() => _MentorWidgetState();
}

class _MentorWidgetState extends State<MentorWidget> {
  late MentorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MentorModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setAppLanguage(context, 'ar');
      if (!((currentUserDisplayName != null && currentUserDisplayName != '') &&
          (currentPhoneNumber != null && currentPhoneNumber != '') &&
          (valueOrDefault(currentUserDocument?.gender, '') != null &&
              valueOrDefault(currentUserDocument?.gender, '') != '') &&
          (valueOrDefault(currentUserDocument?.fullname, '') != null &&
              valueOrDefault(currentUserDocument?.fullname, '') != '') &&
          (valueOrDefault(currentUserDocument?.state, '') != null &&
              valueOrDefault(currentUserDocument?.state, '') != '') &&
          (valueOrDefault(currentUserDocument?.city, '') != null &&
              valueOrDefault(currentUserDocument?.city, '') != '') &&
          (valueOrDefault(currentUserDocument?.schoolLevel, '') != null &&
              valueOrDefault(currentUserDocument?.schoolLevel, '') != '') &&
          (valueOrDefault(currentUserDocument?.job, '') != null &&
              valueOrDefault(currentUserDocument?.job, '') != '') &&
          (valueOrDefault(currentUserDocument?.socialStatus, '') != null &&
              valueOrDefault(currentUserDocument?.socialStatus, '') != '') &&
          (valueOrDefault(currentUserDocument?.pastStudy, '') != null &&
              valueOrDefault(currentUserDocument?.pastStudy, '') != '') &&
          (valueOrDefault(currentUserDocument?.referral, '') != null &&
              valueOrDefault(currentUserDocument?.referral, '') != '') &&
          (valueOrDefault(currentUserDocument?.quranJuz, '') != null &&
              valueOrDefault(currentUserDocument?.quranJuz, '') != '') &&
          (valueOrDefault(currentUserDocument?.telegram, '') != null &&
              valueOrDefault(currentUserDocument?.telegram, '') != ''))) {
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
                child: ProfilecompWidget(),
              ),
            ));
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    _model.commentController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

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

    return Title(
        title: 'mentor',
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
                child: Nav0Widget(),
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 35.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                                  child: TopbarWidget(),
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
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 12.0, 12.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      StreamBuilder<
                                                          List<UsersRecord>>(
                                                    stream: queryUsersRecord(
                                                      queryBuilder:
                                                          (usersRecord) =>
                                                              usersRecord.where(
                                                        'email',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.mentoor,
                                                            ''),
                                                      ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            child:
                                                                SpinKitSquareCircle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 100.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<UsersRecord>
                                                          mesangerUsersRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final mesangerUsersRecord =
                                                          mesangerUsersRecordList
                                                                  .isNotEmpty
                                                              ? mesangerUsersRecordList
                                                                  .first
                                                              : null;
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 5.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.0),
                                                        ),
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 700.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x34090F13),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    offset: Offset(0.0, 2.0),
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
                                                                                            mesangerUsersRecord!.photoUrl,
                                                                                          ),
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: mesangerUsersRecord!.photoUrl,
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: mesangerUsersRecord!.photoUrl,
                                                                                  transitionOnUserGestures: true,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                    child: OctoImage(
                                                                                      placeholderBuilder: OctoPlaceholder.blurHash(
                                                                                        '.',
                                                                                      ),
                                                                                      image: NetworkImage(
                                                                                        mesangerUsersRecord!.photoUrl,
                                                                                      ),
                                                                                      width: 35.0,
                                                                                      height: 35.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      mesangerUsersRecord!.fullname,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 18.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      mesangerUsersRecord!.phoneNumber,
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 15.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await launchURL(mesangerUsersRecord!.telegram);
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.telegramPlane,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await launchUrl(Uri(
                                                                                        scheme: 'tel',
                                                                                        path: mesangerUsersRecord!.phoneNumber,
                                                                                      ));
                                                                                      await Clipboard.setData(ClipboardData(text: mesangerUsersRecord!.phoneNumber));
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.phoneSquareAlt,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        height:
                                                                            12.0,
                                                                        thickness:
                                                                            2.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: StreamBuilder<List<DiscussionRecord>>(
                                                                                    stream: queryDiscussionRecord(
                                                                                      queryBuilder: (discussionRecord) => discussionRecord
                                                                                          .where(
                                                                                            'userA',
                                                                                            isEqualTo: currentUserReference,
                                                                                          )
                                                                                          .where(
                                                                                            'mentor',
                                                                                            isEqualTo: mesangerUsersRecord?.reference,
                                                                                          )
                                                                                          .orderBy('sendTime', descending: true),
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
                                                                                      List<DiscussionRecord> commentsDiscussionRecordList = snapshot.data!;
                                                                                      if (commentsDiscussionRecordList.isEmpty) {
                                                                                        return Center(
                                                                                          child: Image.asset(
                                                                                            'assets/images/5928294_3009287.jpg',
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      return ListView.separated(
                                                                                        padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: commentsDiscussionRecordList.length,
                                                                                        separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                        itemBuilder: (context, commentsIndex) {
                                                                                          final commentsDiscussionRecord = commentsDiscussionRecordList[commentsIndex];
                                                                                          return StreamBuilder<UsersRecord>(
                                                                                            stream: UsersRecord.getDocument(commentsDiscussionRecord.sender!),
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
                                                                                              final containerUsersRecord = snapshot.data!;
                                                                                              return Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    InkWell(
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
                                                                                                              image: Image.network(
                                                                                                                containerUsersRecord.photoUrl,
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
                                                                                                        tag: containerUsersRecord.photoUrl,
                                                                                                        transitionOnUserGestures: true,
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                                          child: Image.network(
                                                                                                            containerUsersRecord.photoUrl,
                                                                                                            width: 40.0,
                                                                                                            height: 40.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            constraints: BoxConstraints(
                                                                                                              maxWidth: MediaQuery.sizeOf(context).width * 0.75,
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0xFFE0E3E7),
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  GradientText(
                                                                                                                    containerUsersRecord.displayName,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Cairo',
                                                                                                                          color: Color(0xFF14181B),
                                                                                                                          fontSize: 12.0,
                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                        ),
                                                                                                                    colors: [
                                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                                      FlutterFlowTheme.of(context).secondary
                                                                                                                    ],
                                                                                                                    gradientDirection: GradientDirection.ltr,
                                                                                                                    gradientType: GradientType.linear,
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    commentsDiscussionRecord.text,
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                          fontFamily: 'Cairo',
                                                                                                                          color: Color(0xFF14181B),
                                                                                                                          fontSize: 14.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  if (commentsDiscussionRecord.doc != null && commentsDiscussionRecord.doc != '')
                                                                                                                    InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        await launchURL(commentsDiscussionRecord.doc);
                                                                                                                      },
                                                                                                                      child: Icon(
                                                                                                                        Icons.picture_as_pdf_outlined,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 40.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  if (commentsDiscussionRecord.image != null && commentsDiscussionRecord.image != '')
                                                                                                                    InkWell(
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
                                                                                                                              image: Image.network(
                                                                                                                                commentsDiscussionRecord.image,
                                                                                                                                fit: BoxFit.contain,
                                                                                                                              ),
                                                                                                                              allowRotation: false,
                                                                                                                              tag: commentsDiscussionRecord.image,
                                                                                                                              useHeroAnimation: true,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                      child: Hero(
                                                                                                                        tag: commentsDiscussionRecord.image,
                                                                                                                        transitionOnUserGestures: true,
                                                                                                                        child: ClipRRect(
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          child: Image.network(
                                                                                                                            commentsDiscussionRecord.image,
                                                                                                                            width: 300.0,
                                                                                                                            height: 200.0,
                                                                                                                            fit: BoxFit.cover,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                dateTimeFormat(
                                                                                                                  'relative',
                                                                                                                  commentsDiscussionRecord.sendTime!,
                                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: 'Cairo',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 10.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 5.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 5.0,
                                                                              color: Color(0x162D3A21),
                                                                              offset: Offset(0.0, 3.0),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Divider(
                                                                              height: 12.0,
                                                                              thickness: 2.0,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          currentUserPhoto,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 5.0)).around(SizedBox(height: 5.0)),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: TextFormField(
                                                                                        controller: _model.commentController,
                                                                                        focusNode: _model.commentFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.commentController',
                                                                                          Duration(milliseconds: 1000),
                                                                                          () => setState(() {}),
                                                                                        ),
                                                                                        autofocus: true,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'b6lxnl3i' /* Write something... */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: 'Cairo',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 12.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(9.0),
                                                                                          ),
                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 8.0, 12.0),
                                                                                          prefixIcon: Icon(
                                                                                            Icons.format_align_right_rounded,
                                                                                          ),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Cairo',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                        maxLines: 8,
                                                                                        minLines: 3,
                                                                                        validator: _model.commentControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 12.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          final selectedFiles = await selectFiles(
                                                                                            allowedExtensions: ['pdf'],
                                                                                            multiFile: false,
                                                                                          );
                                                                                          if (selectedFiles != null) {
                                                                                            setState(() => _model.isDataUploading1 = true);
                                                                                            var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                            var downloadUrls = <String>[];
                                                                                            try {
                                                                                              selectedUploadedFiles = selectedFiles
                                                                                                  .map((m) => FFUploadedFile(
                                                                                                        name: m.storagePath.split('/').last,
                                                                                                        bytes: m.bytes,
                                                                                                      ))
                                                                                                  .toList();

                                                                                              downloadUrls = (await Future.wait(
                                                                                                selectedFiles.map(
                                                                                                  (f) async => await uploadData(f.storagePath, f.bytes),
                                                                                                ),
                                                                                              ))
                                                                                                  .where((u) => u != null)
                                                                                                  .map((u) => u!)
                                                                                                  .toList();
                                                                                            } finally {
                                                                                              _model.isDataUploading1 = false;
                                                                                            }
                                                                                            if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                              setState(() {
                                                                                                _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                                _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                              });
                                                                                            } else {
                                                                                              setState(() {});
                                                                                              return;
                                                                                            }
                                                                                          }

                                                                                          await DiscussionRecord.collection.doc().set(createDiscussionRecordData(
                                                                                                sender: currentUserReference,
                                                                                                receiver: mesangerUsersRecord?.reference,
                                                                                                mentoring: true,
                                                                                                sendTime: getCurrentTimestamp,
                                                                                                chattId: '${currentUserEmail}${mesangerUsersRecord?.email}',
                                                                                                doc: _model.uploadedFileUrl1,
                                                                                                mentor: mesangerUsersRecord?.reference,
                                                                                                userA: currentUserReference,
                                                                                              ));
                                                                                          triggerPushNotification(
                                                                                            notificationTitle: 'رسالة جديدة  ',
                                                                                            notificationText: 'رسالة جديدة من  ${currentUserDisplayName}',
                                                                                            notificationSound: 'default',
                                                                                            userRefs: [
                                                                                              mesangerUsersRecord!.reference
                                                                                            ],
                                                                                            initialPageName: 'mentor',
                                                                                            parameterData: {},
                                                                                          );
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.attachment_sharp,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 40.0,
                                                                                        ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                            context: context,
                                                                                            allowPhoto: true,
                                                                                          );
                                                                                          if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                            setState(() => _model.isDataUploading2 = true);
                                                                                            var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                            var downloadUrls = <String>[];
                                                                                            try {
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
                                                                                              _model.isDataUploading2 = false;
                                                                                            }
                                                                                            if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                              setState(() {
                                                                                                _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                                _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                              });
                                                                                            } else {
                                                                                              setState(() {});
                                                                                              return;
                                                                                            }
                                                                                          }

                                                                                          await DiscussionRecord.collection.doc().set(createDiscussionRecordData(
                                                                                                sender: currentUserReference,
                                                                                                receiver: mesangerUsersRecord?.reference,
                                                                                                mentoring: true,
                                                                                                sendTime: getCurrentTimestamp,
                                                                                                chattId: '${currentUserEmail}${mesangerUsersRecord?.email}',
                                                                                                image: _model.uploadedFileUrl2,
                                                                                                mentor: mesangerUsersRecord?.reference,
                                                                                                userA: currentUserReference,
                                                                                              ));
                                                                                          triggerPushNotification(
                                                                                            notificationTitle: 'رسالة جديدة  ',
                                                                                            notificationText: 'رسالة جديدة من  ${currentUserDisplayName}',
                                                                                            notificationSound: 'default',
                                                                                            userRefs: [
                                                                                              mesangerUsersRecord!.reference
                                                                                            ],
                                                                                            initialPageName: 'mentor',
                                                                                            parameterData: {},
                                                                                          );
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.image,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 30.0,
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        if (_model.commentController.text != null && _model.commentController.text != '') {
                                                                                          await DiscussionRecord.collection.doc().set(createDiscussionRecordData(
                                                                                                text: _model.commentController.text,
                                                                                                sender: currentUserReference,
                                                                                                receiver: mesangerUsersRecord?.reference,
                                                                                                mentoring: true,
                                                                                                sendTime: getCurrentTimestamp,
                                                                                                chattId: '${currentUserEmail}${mesangerUsersRecord?.email}',
                                                                                                userA: currentUserReference,
                                                                                                mentor: mesangerUsersRecord?.reference,
                                                                                              ));
                                                                                          triggerPushNotification(
                                                                                            notificationTitle: 'رسالة جديدة  ',
                                                                                            notificationText: 'رسالة جديدة من  ${currentUserDisplayName}',
                                                                                            notificationSound: 'default',
                                                                                            userRefs: [
                                                                                              mesangerUsersRecord!.reference
                                                                                            ],
                                                                                            initialPageName: 'mentor',
                                                                                            parameterData: {},
                                                                                          );
                                                                                          setState(() {
                                                                                            _model.commentController?.clear();
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '6l1kf5kt' /* إرسال */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        width: 90.0,
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Cairo',
                                                                                              color: Colors.white,
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                        elevation: 2.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 5.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
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
  }
}
