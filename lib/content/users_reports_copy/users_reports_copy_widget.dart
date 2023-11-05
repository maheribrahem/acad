import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'users_reports_copy_model.dart';
export 'users_reports_copy_model.dart';

class UsersReportsCopyWidget extends StatefulWidget {
  const UsersReportsCopyWidget({Key? key}) : super(key: key);

  @override
  _UsersReportsCopyWidgetState createState() => _UsersReportsCopyWidgetState();
}

class _UsersReportsCopyWidgetState extends State<UsersReportsCopyWidget>
    with TickerProviderStateMixin {
  late UsersReportsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersReportsCopyModel());

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

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return StreamBuilder<List<ActivitiesProgressRecord>>(
      stream: queryActivitiesProgressRecord(
        queryBuilder: (activitiesProgressRecord) =>
            activitiesProgressRecord.where(
          'user',
          isEqualTo: currentUserReference,
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
        List<ActivitiesProgressRecord>
            usersReportsCopyActivitiesProgressRecordList = snapshot.data!;
        return Title(
            title: 'usersReportsCopy',
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 1.00),
                                              child: Container(
                                                height: 900.0,
                                                constraints: BoxConstraints(
                                                  maxWidth: 700.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x320E151B),
                                                      offset: Offset(0.0, -2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
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
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  16.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.safePop();
                                                            },
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '15f0jnup' /* عودة */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 5.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  Alignment(
                                                                      0.0, 0),
                                                              child: TabBar(
                                                                isScrollable:
                                                                    true,
                                                                labelColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                unselectedLabelColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                                unselectedLabelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium,
                                                                indicatorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                tabs: [
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qjwm1l88' /* عام */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'npeerkld' /* الاختبارات */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'bli6wd5u' /* التدريبات */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'odrpr0si' /* الحضور/السماع */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'c0ndwmtr' /* القرآن */,
                                                                    ),
                                                                  ),
                                                                ],
                                                                controller: _model
                                                                    .tabBarController,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: TabBarView(
                                                                controller: _model
                                                                    .tabBarController,
                                                                children: [
                                                                  KeepAliveWidgetWrapper(
                                                                    builder: (context) =>
                                                                        StreamBuilder<
                                                                            List<CategRecord>>(
                                                                      stream:
                                                                          queryCategRecord(
                                                                        queryBuilder:
                                                                            (categRecord) =>
                                                                                categRecord.where(
                                                                          'available',
                                                                          isEqualTo:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              child: SpinKitSquareCircle(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 100.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<CategRecord>
                                                                            columnCategRecordList =
                                                                            snapshot.data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              columnCategRecordList.length,
                                                                              (columnIndex) {
                                                                            final columnCategRecord =
                                                                                columnCategRecordList[columnIndex];
                                                                            return Wrap(
                                                                              spacing: 0.0,
                                                                              runSpacing: 0.0,
                                                                              alignment: WrapAlignment.start,
                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              runAlignment: WrapAlignment.start,
                                                                              verticalDirection: VerticalDirection.down,
                                                                              clipBehavior: Clip.none,
                                                                              children: [
                                                                                StreamBuilder<List<SupjRecord>>(
                                                                                  stream: querySupjRecord(
                                                                                    queryBuilder: (supjRecord) => supjRecord
                                                                                        .where(
                                                                                          'visibility',
                                                                                          isEqualTo: true,
                                                                                        )
                                                                                        .where(
                                                                                          'supCateg',
                                                                                          isEqualTo: columnCategRecord.reference,
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
                                                                                    List<SupjRecord> containerSupjRecordList = snapshot.data!;
                                                                                    return Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                        child: StreamBuilder<List<ActivitiesRecord>>(
                                                                                          stream: queryActivitiesRecord(
                                                                                            queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                                .where(
                                                                                                  'type',
                                                                                                  isEqualTo: 'test',
                                                                                                )
                                                                                                .where(
                                                                                                  'isFinal',
                                                                                                  isEqualTo: true,
                                                                                                )
                                                                                                .whereIn('supjRef', containerSupjRecordList.map((e) => e.reference).toList()),
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
                                                                                            List<ActivitiesRecord> containerActivitiesRecordList = snapshot.data!;
                                                                                            return Container(
                                                                                              width: 100.0,
                                                                                              height: 130.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(18.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    CircularPercentIndicator(
                                                                                                      percent: 0.5,
                                                                                                      radius: 37.5,
                                                                                                      lineWidth: 12.0,
                                                                                                      animation: true,
                                                                                                      animateFromLastPercent: true,
                                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                      center: Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '8gdm3mr1' /* 50% */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          containerActivitiesRecordList.length.toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Cairo',
                                                                                                                fontSize: 22.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          usersReportsCopyActivitiesProgressRecordList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().length.toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Cairo',
                                                                                                                fontSize: 22.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 130.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(18.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          CircularPercentIndicator(
                                                                                            percent: 0.5,
                                                                                            radius: 37.5,
                                                                                            lineWidth: 12.0,
                                                                                            animation: true,
                                                                                            animateFromLastPercent: true,
                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                            center: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'oz8qucka' /* 50% */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'vvlvbzxk' /* التدريبات */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Cairo',
                                                                                                  fontSize: 22.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 130.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(18.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          CircularPercentIndicator(
                                                                                            percent: 0.5,
                                                                                            radius: 37.5,
                                                                                            lineWidth: 12.0,
                                                                                            animation: true,
                                                                                            animateFromLastPercent: true,
                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                            center: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'p4fxvj17' /* 50% */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'tic8b319' /* الحضور */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Cairo',
                                                                                                  fontSize: 22.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 130.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(18.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          CircularPercentIndicator(
                                                                                            percent: 0.5,
                                                                                            radius: 37.5,
                                                                                            lineWidth: 12.0,
                                                                                            animation: true,
                                                                                            animateFromLastPercent: true,
                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                            center: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'h4v3iwzx' /* 50% */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'mp97vvzy' /* القرآن */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Cairo',
                                                                                                  fontSize: 22.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  KeepAliveWidgetWrapper(
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              CategRecord>>(
                                                                        stream:
                                                                            queryCategRecord(
                                                                          queryBuilder: (categRecord) =>
                                                                              categRecord.where(
                                                                            'available',
                                                                            isEqualTo:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<CategRecord>
                                                                              columnCategRecordList =
                                                                              snapshot.data!;
                                                                          return SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(columnCategRecordList.length, (columnIndex) {
                                                                                final columnCategRecord = columnCategRecordList[columnIndex];
                                                                                return StreamBuilder<List<SupjRecord>>(
                                                                                  stream: querySupjRecord(
                                                                                    queryBuilder: (supjRecord) => supjRecord.where(
                                                                                      'supCateg',
                                                                                      isEqualTo: columnCategRecord.reference,
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
                                                                                    List<SupjRecord> columnSupjRecordList = snapshot.data!;
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(columnSupjRecordList.length, (columnIndex) {
                                                                                        final columnSupjRecord = columnSupjRecordList[columnIndex];
                                                                                        return StreamBuilder<List<ActivitiesRecord>>(
                                                                                          stream: queryActivitiesRecord(
                                                                                            queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                                .where(
                                                                                                  'supjRef',
                                                                                                  isEqualTo: columnSupjRecord.reference,
                                                                                                )
                                                                                                .where(
                                                                                                  'type',
                                                                                                  isEqualTo: 'test',
                                                                                                )
                                                                                                .where(
                                                                                                  'isFinal',
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
                                                                                            List<ActivitiesRecord> testRefsActivitiesRecordList = snapshot.data!;
                                                                                            return Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Visibility(
                                                                                                visible: testRefsActivitiesRecordList.length >= 1,
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Flexible(
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return WebViewAware(
                                                                                                                      child: AlertDialog(
                                                                                                                    title: Text('تنبيه'),
                                                                                                                    content: Text('هذا الاختبار نهائي ولا يحتوي إلا على محاولة واحدة ..... هل تريد الاستمرار'),
                                                                                                                    actions: [
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                        child: Text('خروج'),
                                                                                                                      ),
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                        child: Text('استمرار'),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ));
                                                                                                                },
                                                                                                              ) ??
                                                                                                              false;
                                                                                                          if (confirmDialogResponse) {
                                                                                                            context.pushNamed(
                                                                                                              'testContent',
                                                                                                              queryParameters: {
                                                                                                                'testRef': serializeParam(
                                                                                                                  testRefsActivitiesRecordList.first.reference,
                                                                                                                  ParamType.DocumentReference,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                            child: StreamBuilder<List<ActivitiesRecord>>(
                                                                                                              stream: queryActivitiesRecord(
                                                                                                                queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                                                    .where(
                                                                                                                      'supjRef',
                                                                                                                      isEqualTo: columnSupjRecord.reference,
                                                                                                                    )
                                                                                                                    .where(
                                                                                                                      'type',
                                                                                                                      isEqualTo: 'test',
                                                                                                                    )
                                                                                                                    .where(
                                                                                                                      'isFinal',
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
                                                                                                                List<ActivitiesRecord> containerActivitiesRecordList = snapshot.data!;
                                                                                                                return Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    borderRadius: BorderRadius.circular(14.0),
                                                                                                                  ),
                                                                                                                  child: Visibility(
                                                                                                                    visible: containerActivitiesRecordList.length >= 1,
                                                                                                                    child: Container(
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  columnSupjRecord.name,
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Cairo',
                                                                                                                                        fontSize: 18.0,
                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  if ((containerActivitiesRecordList.length <= 0) || (usersReportsCopyActivitiesProgressRecordList.where((e) => e.activitID?.id == containerActivitiesRecordList.first.reference.id).toList().length <= 0))
                                                                                                                                    CircularPercentIndicator(
                                                                                                                                      percent: 0.0,
                                                                                                                                      radius: 37.5,
                                                                                                                                      lineWidth: 12.0,
                                                                                                                                      animation: true,
                                                                                                                                      animateFromLastPercent: true,
                                                                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                                      center: Text(
                                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                                          'j3pcbuor' /* 0% */,
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  if ((containerActivitiesRecordList.length >= 1) && (usersReportsCopyActivitiesProgressRecordList.where((e) => e.activitID?.id == containerActivitiesRecordList.first.reference.id).toList().length >= 1))
                                                                                                                                    CircularPercentIndicator(
                                                                                                                                      percent: usersReportsCopyActivitiesProgressRecordList.where((e) => e.activitID?.id == containerActivitiesRecordList.first.reference.id).toList().first.grade > 1.0 ? 1.0 : usersReportsCopyActivitiesProgressRecordList.where((e) => e.activitID?.id == containerActivitiesRecordList.first.reference.id).toList().first.grade,
                                                                                                                                      radius: 37.5,
                                                                                                                                      lineWidth: 12.0,
                                                                                                                                      animation: true,
                                                                                                                                      animateFromLastPercent: true,
                                                                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                                      center: Text(
                                                                                                                                        formatNumber(
                                                                                                                                          usersReportsCopyActivitiesProgressRecordList.where((e) => e.activitID?.id == containerActivitiesRecordList.first.reference.id).toList().first.grade > 1.0 ? 100.0 : (usersReportsCopyActivitiesProgressRecordList.where((e) => e.activitID?.id == containerActivitiesRecordList.first.reference.id).toList().first.grade * 100),
                                                                                                                                          formatType: FormatType.custom,
                                                                                                                                          format: '#',
                                                                                                                                          locale: '',
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
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
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  KeepAliveWidgetWrapper(
                                                                    builder: (context) =>
                                                                        StreamBuilder<
                                                                            List<ActivitiesRecord>>(
                                                                      stream:
                                                                          queryActivitiesRecord(
                                                                        queryBuilder: (activitiesRecord) => activitiesRecord
                                                                            .where(
                                                                              'available',
                                                                              isEqualTo: true,
                                                                            )
                                                                            .where(
                                                                              'type',
                                                                              isEqualTo: 'test',
                                                                            )
                                                                            .where(
                                                                              'isFinal',
                                                                              isNotEqualTo: true,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              child: SpinKitSquareCircle(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 100.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<ActivitiesRecord>
                                                                            containerActivitiesRecordList =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              StreamBuilder<List<CategRecord>>(
                                                                            stream:
                                                                                queryCategRecord(
                                                                              queryBuilder: (categRecord) => categRecord.where(
                                                                                'available',
                                                                                isEqualTo: true,
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<CategRecord> columnCategRecordList = snapshot.data!;
                                                                              return SingleChildScrollView(
                                                                                primary: false,
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(columnCategRecordList.length, (columnIndex) {
                                                                                    final columnCategRecord = columnCategRecordList[columnIndex];
                                                                                    return StreamBuilder<List<SupjRecord>>(
                                                                                      stream: querySupjRecord(
                                                                                        queryBuilder: (supjRecord) => supjRecord.where(
                                                                                          'supCateg',
                                                                                          isEqualTo: columnCategRecord.reference,
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
                                                                                        List<SupjRecord> columnSupjRecordList = snapshot.data!;
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: List.generate(columnSupjRecordList.length, (columnIndex) {
                                                                                            final columnSupjRecord = columnSupjRecordList[columnIndex];
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                      child: StreamBuilder<List<ActivitiesRecord>>(
                                                                                                        stream: queryActivitiesRecord(
                                                                                                          queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                                              .where(
                                                                                                                'supjRef',
                                                                                                                isEqualTo: columnSupjRecord.reference,
                                                                                                              )
                                                                                                              .where(
                                                                                                                'type',
                                                                                                                isEqualTo: 'lesson',
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
                                                                                                          List<ActivitiesRecord> containerActivitiesRecordList = snapshot.data!;
                                                                                                          return Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(14.0),
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        columnSupjRecord.name,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Cairo',
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      if (usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().length >= 1)
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              containerActivitiesRecordList.where((e) => e.supjRef == columnSupjRecord.reference).toList().length.toString(),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Cairo',
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().length.toString(),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Cairo',
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              formatNumber(
                                                                                                                                functions.sumList(usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().map((e) => e.grade).toList()),
                                                                                                                                formatType: FormatType.custom,
                                                                                                                                format: '#',
                                                                                                                                locale: '',
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Cairo',
                                                                                                                                    fontSize: 18.0,
                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                                                        ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        if (usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().length <= 0)
                                                                                                                          CircularPercentIndicator(
                                                                                                                            percent: 0.0,
                                                                                                                            radius: 37.5,
                                                                                                                            lineWidth: 12.0,
                                                                                                                            animation: true,
                                                                                                                            animateFromLastPercent: true,
                                                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                            center: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'x6fi7ce4' /* 0% */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        if (usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().length >= 1)
                                                                                                                          CircularPercentIndicator(
                                                                                                                            percent: functions.attendanceGrade(usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().length.toDouble(), functions.sumList(usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().map((e) => e.grade).toList()), 0.0)!,
                                                                                                                            radius: 37.5,
                                                                                                                            lineWidth: 12.0,
                                                                                                                            animation: true,
                                                                                                                            animateFromLastPercent: true,
                                                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                            center: Text(
                                                                                                                              '${formatNumber(
                                                                                                                                functions.attendanceGrade(usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().length.toDouble(), functions.sumList(usersReportsCopyActivitiesProgressRecordList.where((e) => e.supjID == columnSupjRecord.reference).toList().map((e) => e.grade).toList()), 0.0)! * 100,
                                                                                                                                formatType: FormatType.custom,
                                                                                                                                format: '#',
                                                                                                                                locale: '',
                                                                                                                              )}%',
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
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
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          }),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  KeepAliveWidgetWrapper(
                                                                    builder: (context) =>
                                                                        StreamBuilder<
                                                                            List<CategRecord>>(
                                                                      stream:
                                                                          queryCategRecord(
                                                                        queryBuilder:
                                                                            (categRecord) =>
                                                                                categRecord.where(
                                                                          'available',
                                                                          isEqualTo:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              child: SpinKitSquareCircle(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 100.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<CategRecord>
                                                                            containerCategRecordList =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              StreamBuilder<List<CategRecord>>(
                                                                            stream:
                                                                                queryCategRecord(
                                                                              queryBuilder: (categRecord) => categRecord.where(
                                                                                'available',
                                                                                isEqualTo: true,
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<CategRecord> columnCategRecordList = snapshot.data!;
                                                                              return SingleChildScrollView(
                                                                                primary: false,
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(columnCategRecordList.length, (columnIndex) {
                                                                                    final columnCategRecord = columnCategRecordList[columnIndex];
                                                                                    return StreamBuilder<List<SupjRecord>>(
                                                                                      stream: querySupjRecord(
                                                                                        queryBuilder: (supjRecord) => supjRecord.where(
                                                                                          'supCateg',
                                                                                          isEqualTo: columnCategRecord.reference,
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
                                                                                        List<SupjRecord> columnSupjRecordList = snapshot.data!;
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: List.generate(columnSupjRecordList.length, (columnIndex) {
                                                                                            final columnSupjRecord = columnSupjRecordList[columnIndex];
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                      child: StreamBuilder<List<ActivitiesRecord>>(
                                                                                                        stream: queryActivitiesRecord(
                                                                                                          queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                                              .where(
                                                                                                                'supjRef',
                                                                                                                isEqualTo: columnSupjRecord.reference,
                                                                                                              )
                                                                                                              .where(
                                                                                                                'type',
                                                                                                                isEqualTo: 'lesson',
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
                                                                                                          List<ActivitiesRecord> containerActivitiesRecordList = snapshot.data!;
                                                                                                          return Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(14.0),
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        columnSupjRecord.name,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'Cairo',
                                                                                                                              fontSize: 18.0,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    CircularPercentIndicator(
                                                                                                                      percent: functions.attendanceGrade(containerActivitiesRecordList.length.toDouble(), usersReportsCopyActivitiesProgressRecordList.where((e) => (e.isSeen == true) && (e.supjID == columnSupjRecord.reference)).toList().length.toDouble(), usersReportsCopyActivitiesProgressRecordList.where((e) => (e.isAttended == true) && (e.supjID == columnSupjRecord.reference)).toList().length.toDouble())!,
                                                                                                                      radius: 37.5,
                                                                                                                      lineWidth: 12.0,
                                                                                                                      animation: true,
                                                                                                                      animateFromLastPercent: true,
                                                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                      center: Text(
                                                                                                                        '${formatNumber(
                                                                                                                          functions.attendanceGrade(containerActivitiesRecordList.length.toDouble(), usersReportsCopyActivitiesProgressRecordList.where((e) => (e.isSeen == true) && (e.supjID == columnSupjRecord.reference)).toList().length.toDouble(), usersReportsCopyActivitiesProgressRecordList.where((e) => (e.isAttended == true) && (e.supjID == columnSupjRecord.reference)).toList().length.toDouble())! * 100,
                                                                                                                          formatType: FormatType.custom,
                                                                                                                          format: '#',
                                                                                                                          locale: '',
                                                                                                                        )}%',
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          }),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  KeepAliveWidgetWrapper(
                                                                    builder: (context) =>
                                                                        StreamBuilder<
                                                                            List<CategRecord>>(
                                                                      stream:
                                                                          queryCategRecord(
                                                                        queryBuilder:
                                                                            (categRecord) =>
                                                                                categRecord.where(
                                                                          'available',
                                                                          isEqualTo:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              child: SpinKitSquareCircle(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 100.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<CategRecord>
                                                                            columnCategRecordList =
                                                                            snapshot.data!;
                                                                        return SingleChildScrollView(
                                                                          primary:
                                                                              false,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(columnCategRecordList.length, (columnIndex) {
                                                                              final columnCategRecord = columnCategRecordList[columnIndex];
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                      child: StreamBuilder<List<ActivitiesProgressRecord>>(
                                                                                        stream: queryActivitiesProgressRecord(
                                                                                          queryBuilder: (activitiesProgressRecord) => activitiesProgressRecord.where(
                                                                                            'categRef',
                                                                                            isEqualTo: columnCategRecord.reference,
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
                                                                                          List<ActivitiesProgressRecord> containerActivitiesProgressRecordList = snapshot.data!;
                                                                                          final containerActivitiesProgressRecord = containerActivitiesProgressRecordList.isNotEmpty ? containerActivitiesProgressRecordList.first : null;
                                                                                          return Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(14.0),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        columnCategRecord.name,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Cairo',
                                                                                                              fontSize: 18.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'الدرجة : ${usersReportsCopyActivitiesProgressRecordList.first.grade.toString()}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    CircularPercentIndicator(
                                                                                                      percent: containerActivitiesProgressRecord!.grade / 100,
                                                                                                      radius: 37.5,
                                                                                                      lineWidth: 12.0,
                                                                                                      animation: true,
                                                                                                      animateFromLastPercent: true,
                                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      center: Text(
                                                                                                        '${containerActivitiesProgressRecord?.grade?.toString()}%',
                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                              fontFamily: 'Cairo',
                                                                                                              fontSize: 19.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
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
              ),
            ));
      },
    );
  }
}
