import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/components/users_data/users_data_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart' as badges;
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
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'supadmin_users_model.dart';
export 'supadmin_users_model.dart';

class SupadminUsersWidget extends StatefulWidget {
  const SupadminUsersWidget({
    Key? key,
    this.output,
    this.filter,
  }) : super(key: key);

  final bool? output;
  final String? filter;

  @override
  _SupadminUsersWidgetState createState() => _SupadminUsersWidgetState();
}

class _SupadminUsersWidgetState extends State<SupadminUsersWidget>
    with TickerProviderStateMixin {
  late SupadminUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupadminUsersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setAppLanguage(context, 'ar');
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.mentoorController ??= TextEditingController(
        text: '${currentUserEmail}/${_model.textController1.text}');
    _model.mentoorFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'isSuper',
          isEqualTo: true,
        ),
      ),
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
        List<UsersRecord> supadminUsersUsersRecordList = snapshot.data!;
        return Title(
            title: 'supadminUsers',
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
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      5.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFE0E3E7),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          23.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: badges.Badge(
                                                                                badgeContent: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'n38cja61' /* 1 */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Cairo',
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                ),
                                                                                showBadge: true,
                                                                                shape: badges.BadgeShape.circle,
                                                                                badgeColor: FlutterFlowTheme.of(context).primary,
                                                                                elevation: 4.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                position: badges.BadgePosition.topEnd(),
                                                                                animationType: badges.BadgeAnimationType.scale,
                                                                                toAnimate: true,
                                                                                child: Icon(
                                                                                  Icons.report_off_outlined,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 30.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: badges.Badge(
                                                                                badgeContent: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '2f0ohlbn' /* 1 */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Cairo',
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                ),
                                                                                showBadge: true,
                                                                                shape: badges.BadgeShape.circle,
                                                                                badgeColor: FlutterFlowTheme.of(context).primary,
                                                                                elevation: 4.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                position: badges.BadgePosition.topEnd(),
                                                                                animationType: badges.BadgeAnimationType.scale,
                                                                                toAnimate: true,
                                                                                child: Icon(
                                                                                  Icons.repeat,
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  size: 30.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: badges.Badge(
                                                                                badgeContent: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '5mx4f3pl' /* 1 */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Cairo',
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                ),
                                                                                showBadge: true,
                                                                                shape: badges.BadgeShape.circle,
                                                                                badgeColor: FlutterFlowTheme.of(context).primary,
                                                                                elevation: 4.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                position: badges.BadgePosition.topEnd(),
                                                                                animationType: badges.BadgeAnimationType.scale,
                                                                                toAnimate: true,
                                                                                child: Icon(
                                                                                  Icons.report,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  size: 30.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 44.0,
                                                                              height: 44.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x4C4B39EF),
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: Color(0xFF4B39EF),
                                                                                  width: 2.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(40.0),
                                                                                    child: Image.network(
                                                                                      currentUserPhoto,
                                                                                      width: 60.0,
                                                                                      height: 60.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => GradientText(
                                                                                    'مرحبا : ${currentUserDisplayName}',
                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                    colors: [
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                      FlutterFlowTheme.of(context).secondary
                                                                                    ],
                                                                                    gradientDirection: GradientDirection.ltr,
                                                                                    gradientType: GradientType.linear,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '0a1i6ew5' /* ملف كامل */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FutureBuilder<int>(
                                                                                future: queryUsersRecordCount(
                                                                                  queryBuilder: (usersRecord) => usersRecord
                                                                                      .where(
                                                                                        'mentoor',
                                                                                        isEqualTo: currentUserEmail,
                                                                                      )
                                                                                      .where(
                                                                                        'isCompleted',
                                                                                        isEqualTo: true,
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
                                                                                  int textCount = snapshot.data!;
                                                                                  return Text(
                                                                                    textCount.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Switch
                                                                              .adaptive(
                                                                            value: _model.compValue ??=
                                                                                true,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.compValue = newValue!);
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            inactiveTrackColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            inactiveThumbColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              1.5,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'rj0kbr8u' /* تم الفحص */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FutureBuilder<int>(
                                                                                future: queryUsersRecordCount(
                                                                                  queryBuilder: (usersRecord) => usersRecord
                                                                                      .where(
                                                                                        'mentoor',
                                                                                        isEqualTo: currentUserEmail,
                                                                                      )
                                                                                      .where(
                                                                                        'isChecked',
                                                                                        isEqualTo: true,
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
                                                                                  int textCount = snapshot.data!;
                                                                                  return Text(
                                                                                    textCount.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Switch
                                                                              .adaptive(
                                                                            value: _model.checkedValue ??=
                                                                                true,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.checkedValue = newValue!);
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            inactiveTrackColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            inactiveThumbColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              1.5,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'jxvjaste' /* حساب حقيقي */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FutureBuilder<int>(
                                                                                future: queryUsersRecordCount(
                                                                                  queryBuilder: (usersRecord) => usersRecord
                                                                                      .where(
                                                                                        'mentoor',
                                                                                        isEqualTo: currentUserEmail,
                                                                                      )
                                                                                      .where(
                                                                                        'isReal',
                                                                                        isEqualTo: true,
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
                                                                                  int textCount = snapshot.data!;
                                                                                  return Text(
                                                                                    textCount.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Switch
                                                                              .adaptive(
                                                                            value: _model.realValue ??=
                                                                                true,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.realValue = newValue!);
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            inactiveTrackColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            inactiveThumbColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              1.5,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'lydcp49r' /* طلابي */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FutureBuilder<int>(
                                                                                future: queryUsersRecordCount(
                                                                                  queryBuilder: (usersRecord) => usersRecord.where(
                                                                                    'mentoor',
                                                                                    isEqualTo: currentUserEmail,
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
                                                                                  int textCount = snapshot.data!;
                                                                                  return Text(
                                                                                    textCount.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Switch
                                                                              .adaptive(
                                                                            value: _model.notValue ??=
                                                                                true,
                                                                            onChanged:
                                                                                (newValue) async {
                                                                              setState(() => _model.notValue = newValue!);
                                                                            },
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            activeTrackColor:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            inactiveTrackColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            inactiveThumbColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                300.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: TextFormField(
                                                                                controller: _model.textController1,
                                                                                focusNode: _model.textFieldFocusNode,
                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                  '_model.textController1',
                                                                                  Duration(milliseconds: 1000),
                                                                                  () => setState(() {}),
                                                                                ),
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    'kzzq93ag' /* الكلمة المفتاحية */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  prefixIcon: Icon(
                                                                                    Icons.person_search_rounded,
                                                                                  ),
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                validator: _model.textController1Validator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                            tablet:
                                                                                false,
                                                                            tabletLandscape:
                                                                                false,
                                                                            desktop:
                                                                                false,
                                                                          ))
                                                                            Container(
                                                                              width: 200.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.mentoorController,
                                                                                  focusNode: _model.mentoorFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.mentoorController',
                                                                                    Duration(milliseconds: 1500),
                                                                                    () => setState(() {}),
                                                                                  ),
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                      'w7qa9n4k' /* Label here... */,
                                                                                    ),
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                    enabledBorder: UnderlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: UnderlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: UnderlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  validator: _model.mentoorControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation1']!),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<UsersRecord>>(
                                                      future:
                                                          UsersRecord.search(
                                                        term:
                                                            '${currentUserEmail}/${_model.textController1.text}',
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 100.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            listViewUsersRecordList =
                                                            snapshot.data!;
                                                        // Customize what your widget looks like with no search results.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container(
                                                            height: 100,
                                                            child: Center(
                                                              child: Text(
                                                                  'No results.'),
                                                            ),
                                                          );
                                                        }
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewUsersRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewUsersRecord =
                                                                listViewUsersRecordList[
                                                                    listViewIndex];
                                                            return Visibility(
                                                              visible:
                                                                  valueOrDefault<
                                                                      bool>(
                                                                () {
                                                                  if (listViewUsersRecord
                                                                          .isCompleted &&
                                                                      _model
                                                                          .compValue!) {
                                                                    return true;
                                                                  } else if (listViewUsersRecord
                                                                          .isChecked &&
                                                                      _model
                                                                          .checkedValue!) {
                                                                    return true;
                                                                  } else if (listViewUsersRecord
                                                                          .isReal &&
                                                                      _model
                                                                          .realValue!) {
                                                                    return true;
                                                                  } else if (_model
                                                                          .notValue! &&
                                                                      (listViewUsersRecord
                                                                              .isCompleted ==
                                                                          false) &&
                                                                      (listViewUsersRecord
                                                                              .isChecked ==
                                                                          false) &&
                                                                      (listViewUsersRecord
                                                                              .isReal ==
                                                                          false)) {
                                                                    return true;
                                                                  } else {
                                                                    return false;
                                                                  }
                                                                }(),
                                                                true,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 70.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            0.0,
                                                                        color: Color(
                                                                            0xFFE0E3E7),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            23.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              listViewIndex.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                            Container(
                                                                              width: 44.0,
                                                                              height: 44.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x4C4B39EF),
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: Color(0xFF4B39EF),
                                                                                  width: 2.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                                  child: Image.network(
                                                                                    listViewUsersRecord.photoUrl,
                                                                                    width: 60.0,
                                                                                    height: 60.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      listViewUsersRecord.displayName.maybeHandleOverflow(
                                                                                        maxChars: 13,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 16.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await Clipboard.setData(ClipboardData(text: listViewUsersRecord.phoneNumber));
                                                                                      await launchUrl(Uri(
                                                                                        scheme: 'tel',
                                                                                        path: listViewUsersRecord.phoneNumber,
                                                                                      ));
                                                                                    },
                                                                                    child: GradientText(
                                                                                      listViewUsersRecord.phoneNumber.maybeHandleOverflow(
                                                                                        maxChars: 11,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                      colors: [
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                        FlutterFlowTheme.of(context).secondary
                                                                                      ],
                                                                                      gradientDirection: GradientDirection.ltr,
                                                                                      gradientType: GradientType.linear,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 30.0,
                                                                                          buttonSize: 30.0,
                                                                                          icon: FaIcon(
                                                                                            FontAwesomeIcons.fileInvoice,
                                                                                            color: listViewUsersRecord.isCompleted == true ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            if (listViewUsersRecord.isCompleted) {
                                                                                              await listViewUsersRecord.reference.update(createUsersRecordData(
                                                                                                isCompleted: false,
                                                                                              ));
                                                                                            } else {
                                                                                              await listViewUsersRecord.reference.update(createUsersRecordData(
                                                                                                isCompleted: true,
                                                                                              ));
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 30.0,
                                                                                          buttonSize: 30.0,
                                                                                          icon: Icon(
                                                                                            Icons.check_circle,
                                                                                            color: listViewUsersRecord.isChecked == true ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            if (listViewUsersRecord.isChecked) {
                                                                                              await listViewUsersRecord.reference.update(createUsersRecordData(
                                                                                                isChecked: false,
                                                                                              ));
                                                                                            } else {
                                                                                              await listViewUsersRecord.reference.update(createUsersRecordData(
                                                                                                isChecked: true,
                                                                                              ));
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 30.0,
                                                                                          buttonSize: 30.0,
                                                                                          icon: FaIcon(
                                                                                            FontAwesomeIcons.userCheck,
                                                                                            color: listViewUsersRecord.isReal == true ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            if (listViewUsersRecord.isReal) {
                                                                                              await listViewUsersRecord.reference.update(createUsersRecordData(
                                                                                                isReal: false,
                                                                                              ));
                                                                                            } else {
                                                                                              await listViewUsersRecord.reference.update(createUsersRecordData(
                                                                                                isReal: true,
                                                                                              ));
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 30.0,
                                                                                          buttonSize: 30.0,
                                                                                          icon: Icon(
                                                                                            Icons.nearby_error_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                          onPressed: () {
                                                                                            print('IconButton pressed ...');
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: UsersDataWidget(
                                                                                      doc: listViewUsersRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                ));
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Card(
                                                                            clipBehavior:
                                                                                Clip.antiAliasWithSaveLayer,
                                                                            color:
                                                                                Color(0xFFF1F4F8),
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                              child: Icon(
                                                                                Icons.keyboard_arrow_right_rounded,
                                                                                color: Color(0xFF57636C),
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 5.0)),
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation2']!),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
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
