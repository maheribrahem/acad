import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
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
import 'users_reports_model.dart';
export 'users_reports_model.dart';

class UsersReportsWidget extends StatefulWidget {
  const UsersReportsWidget({
    Key? key,
    this.inspection,
  }) : super(key: key);

  final DocumentReference? inspection;

  @override
  _UsersReportsWidgetState createState() => _UsersReportsWidgetState();
}

class _UsersReportsWidgetState extends State<UsersReportsWidget>
    with TickerProviderStateMixin {
  late UsersReportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersReportsModel());

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

    return FutureBuilder<List<ActivitiesProgressRow>>(
      future: ActivitiesProgressTable().queryRows(
        queryFn: (q) => q.eq(
          'userID',
          widget.inspection != null
              ? widget.inspection?.id
              : currentUserReference?.id,
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
        List<ActivitiesProgressRow> usersReportsActivitiesProgressRowList =
            snapshot.data!;
        return Title(
            title: 'usersReports',
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
                                                                .spaceBetween,
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
                                                                      '63dzf8pu' /* عودة */,
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
                                                          if (widget
                                                                  .inspection !=
                                                              null)
                                                            StreamBuilder<
                                                                UsersRecord>(
                                                              stream: UsersRecord
                                                                  .getDocument(
                                                                      widget
                                                                          .inspection!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      child:
                                                                          SpinKitSquareCircle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            100.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final containerUsersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    containerUsersRecord
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                );
                                                              },
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
                                                                      'igtg7ss2' /* عام */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'fgjqlnww' /* الاختبارات */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1f2u2tks' /* التدريبات */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'p4wc6wm8' /* الحضور/السماع */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hp7e4msv' /* القرآن */,
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
                                                                        return SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(columnCategRecordList.length, (columnIndex) {
                                                                              final columnCategRecord = columnCategRecordList[columnIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: StreamBuilder<List<SupjRecord>>(
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
                                                                                        List<SupjRecord> supjSupjRecordList = snapshot.data!;
                                                                                        return Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: StreamBuilder<List<ActivitiesRecord>>(
                                                                                            stream: queryActivitiesRecord(
                                                                                              queryBuilder: (activitiesRecord) => activitiesRecord.whereIn('supjRef', supjSupjRecordList.map((e) => e.reference).toList()),
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
                                                                                              List<ActivitiesRecord> activiActivitiesRecordList = snapshot.data!;
                                                                                              return Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          columnCategRecord.name,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Cairo',
                                                                                                                fontSize: 24.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                              ),
                                                                                                        ),
                                                                                                        if ((false == true) &&
                                                                                                            responsiveVisibility(
                                                                                                              context: context,
                                                                                                              phone: false,
                                                                                                              tablet: false,
                                                                                                              tabletLandscape: false,
                                                                                                              desktop: false,
                                                                                                            ))
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                            child: FutureBuilder<List<ActivitiesProgressRow>>(
                                                                                                              future: ActivitiesProgressTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eq(
                                                                                                                      'userID',
                                                                                                                      currentUserReference?.id,
                                                                                                                    )
                                                                                                                    .in_(
                                                                                                                      'activitID',
                                                                                                                      activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().map((e) => e.reference.id).toList(),
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
                                                                                                                List<ActivitiesProgressRow> containerFinalsActivitiesProgressRowList = snapshot.data!;
                                                                                                                return Container(
                                                                                                                  width: 100.0,
                                                                                                                  height: 130.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                                  ),
                                                                                                                  child: FutureBuilder<List<ActivitiesProgressRow>>(
                                                                                                                    future: ActivitiesProgressTable().queryRows(
                                                                                                                      queryFn: (q) => q
                                                                                                                          .eq(
                                                                                                                            'userID',
                                                                                                                            currentUserReference?.id,
                                                                                                                          )
                                                                                                                          .in_(
                                                                                                                            'activitID',
                                                                                                                            activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal != true)).toList().map((e) => e.reference.id).toList(),
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
                                                                                                                      List<ActivitiesProgressRow> containertestActivitiesProgressRowList = snapshot.data!;
                                                                                                                      return Container(
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: FutureBuilder<List<ActivitiesProgressRow>>(
                                                                                                                          future: ActivitiesProgressTable().queryRows(
                                                                                                                            queryFn: (q) => q
                                                                                                                                .eq(
                                                                                                                                  'userID',
                                                                                                                                  currentUserReference?.id,
                                                                                                                                )
                                                                                                                                .in_(
                                                                                                                                  'activitID',
                                                                                                                                  activiActivitiesRecordList.where((e) => e.type == 'lesson').toList().map((e) => e.reference.id).toList(),
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
                                                                                                                            List<ActivitiesProgressRow> containerAttendActivitiesProgressRowList = snapshot.data!;
                                                                                                                            return Container(
                                                                                                                              decoration: BoxDecoration(),
                                                                                                                              child: Container(
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      if ((containerFinalsActivitiesProgressRowList.where((e) => e.isSeen!).toList().length < 1) && (containerFinalsActivitiesProgressRowList.where((e) => e.isAttended!).toList().length < 1))
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
                                                                                                                                              'emfgm76q' /* 0% */,
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      if ((containerFinalsActivitiesProgressRowList.where((e) => e.isSeen!).toList().length >= 1) || (containerFinalsActivitiesProgressRowList.where((e) => e.isAttended!).toList().length >= 1))
                                                                                                                                        CircularPercentIndicator(
                                                                                                                                          percent: 1 + 1,
                                                                                                                                          radius: 37.5,
                                                                                                                                          lineWidth: 12.0,
                                                                                                                                          animation: true,
                                                                                                                                          animateFromLastPercent: true,
                                                                                                                                          progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                                          center: Text(
                                                                                                                                            '${formatNumber(
                                                                                                                                              functions.attendanceGrade(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal != true)).toList().length.toDouble(), containerFinalsActivitiesProgressRowList.where((e) => e.type == 'test').toList().length.toDouble(), 0.0)! * 100,
                                                                                                                                              formatType: FormatType.custom,
                                                                                                                                              format: '#',
                                                                                                                                              locale: '',
                                                                                                                                            )}%',
                                                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      Text(
                                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                                          'htiy7tbl' /* الاختبارات */,
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
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Wrap(
                                                                                                      spacing: 0.0,
                                                                                                      runSpacing: 0.0,
                                                                                                      alignment: WrapAlignment.start,
                                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                      direction: Axis.horizontal,
                                                                                                      runAlignment: WrapAlignment.start,
                                                                                                      verticalDirection: VerticalDirection.down,
                                                                                                      clipBehavior: Clip.none,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                          child: FutureBuilder<List<ActivitiesProgressRow>>(
                                                                                                            future: ActivitiesProgressTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eq(
                                                                                                                    'userID',
                                                                                                                    widget.inspection != null ? widget.inspection?.id : currentUserReference?.id,
                                                                                                                  )
                                                                                                                  .in_(
                                                                                                                    'activitID',
                                                                                                                    activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().map((e) => e.reference.id).toList(),
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
                                                                                                              List<ActivitiesProgressRow> containerActivitiesProgressRowList = snapshot.data!;
                                                                                                              return Container(
                                                                                                                width: 100.0,
                                                                                                                height: 130.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                                                ),
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().length < 1) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().length < 1))
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
                                                                                                                                'b3exgc4c' /* 0% */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().length >= 1) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().length >= 1))
                                                                                                                          CircularPercentIndicator(
                                                                                                                            percent: functions.attendanceGrade(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal != true)).toList().length.toDouble(), containerActivitiesProgressRowList.where((e) => e.type == 'test').toList().length.toDouble(), 0.0)!,
                                                                                                                            radius: 37.5,
                                                                                                                            lineWidth: 12.0,
                                                                                                                            animation: true,
                                                                                                                            animateFromLastPercent: true,
                                                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                            center: Text(
                                                                                                                              '${formatNumber(
                                                                                                                                functions.attendanceGrade(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal != true)).toList().length.toDouble(), containerActivitiesProgressRowList.where((e) => e.type == 'test').toList().length.toDouble(), 0.0)! * 100,
                                                                                                                                formatType: FormatType.custom,
                                                                                                                                format: '#',
                                                                                                                                locale: '',
                                                                                                                              )}%',
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'p82jcfjn' /* الاختبارات */,
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
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                          child: FutureBuilder<List<ActivitiesProgressRow>>(
                                                                                                            future: ActivitiesProgressTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eq(
                                                                                                                    'userID',
                                                                                                                    widget.inspection != null ? widget.inspection?.id : currentUserReference?.id,
                                                                                                                  )
                                                                                                                  .in_(
                                                                                                                    'activitID',
                                                                                                                    activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal != true)).toList().map((e) => e.reference.id).toList(),
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
                                                                                                              List<ActivitiesProgressRow> containerActivitiesProgressRowList = snapshot.data!;
                                                                                                              return Container(
                                                                                                                width: 100.0,
                                                                                                                height: 130.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                                                ),
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().length < 1) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().length < 1))
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
                                                                                                                                'zyxwddbu' /* 0% */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().length >= 1) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().length >= 1))
                                                                                                                          CircularPercentIndicator(
                                                                                                                            percent: functions.attendanceGrade(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal != true)).toList().length.toDouble(), containerActivitiesProgressRowList.where((e) => e.type == 'test').toList().length.toDouble(), 0.0)!,
                                                                                                                            radius: 37.5,
                                                                                                                            lineWidth: 12.0,
                                                                                                                            animation: true,
                                                                                                                            animateFromLastPercent: true,
                                                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                            center: Text(
                                                                                                                              '${formatNumber(
                                                                                                                                functions.attendanceGrade(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal != true)).toList().length.toDouble(), containerActivitiesProgressRowList.where((e) => e.type == 'test').toList().length.toDouble(), 0.0)! * 100,
                                                                                                                                formatType: FormatType.custom,
                                                                                                                                format: '#',
                                                                                                                                locale: '',
                                                                                                                              )}%',
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'nthdp0nz' /* التدريبات */,
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
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                          child: FutureBuilder<List<ActivitiesProgressRow>>(
                                                                                                            future: ActivitiesProgressTable().queryRows(
                                                                                                              queryFn: (q) => q
                                                                                                                  .eq(
                                                                                                                    'userID',
                                                                                                                    widget.inspection != null ? widget.inspection?.id : currentUserReference?.id,
                                                                                                                  )
                                                                                                                  .in_(
                                                                                                                    'activitID',
                                                                                                                    activiActivitiesRecordList.where((e) => e.type == 'lesson').toList().map((e) => e.reference.id).toList(),
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
                                                                                                              List<ActivitiesProgressRow> containerActivitiesProgressRowList = snapshot.data!;
                                                                                                              return Container(
                                                                                                                width: 100.0,
                                                                                                                height: 130.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                                                ),
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().length < 1) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().length < 1))
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
                                                                                                                                'qpmwczcz' /* 0% */,
                                                                                                                              ),
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().length >= 1) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().length >= 1))
                                                                                                                          CircularPercentIndicator(
                                                                                                                            percent: functions.attendanceGrade(activiActivitiesRecordList.where((e) => e.type == 'lesson').toList().length.toDouble(), containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().length.toDouble(), containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().length.toDouble())!,
                                                                                                                            radius: 37.5,
                                                                                                                            lineWidth: 12.0,
                                                                                                                            animation: true,
                                                                                                                            animateFromLastPercent: true,
                                                                                                                            progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                            backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                            center: Text(
                                                                                                                              '${formatNumber(
                                                                                                                                functions.attendanceGrade(activiActivitiesRecordList.where((e) => e.type == 'lesson').toList().length.toDouble(), containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().length.toDouble(), containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().length.toDouble())! * 100,
                                                                                                                                formatType: FormatType.custom,
                                                                                                                                format: '#',
                                                                                                                                locale: '',
                                                                                                                              )}%',
                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '7vgw0k07' /* الحضور */,
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
                                                                                                              );
                                                                                                            },
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
                                                                                                                  if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().length <= 0)
                                                                                                                    CircularPercentIndicator(
                                                                                                                      percent: 0.0,
                                                                                                                      radius: 37.5,
                                                                                                                      lineWidth: 12.0,
                                                                                                                      animation: true,
                                                                                                                      animateFromLastPercent: true,
                                                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      center: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          '1g65m4l8' /* 0% */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                              fontFamily: 'Cairo',
                                                                                                                              fontSize: 19.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().length >= 1)
                                                                                                                    CircularPercentIndicator(
                                                                                                                      percent: usersReportsActivitiesProgressRowList.where((e) => (e.categID == columnCategRecord.reference.id) && (e.type == 'quran')).toList().first.grade! / 100,
                                                                                                                      radius: 37.5,
                                                                                                                      lineWidth: 12.0,
                                                                                                                      animation: true,
                                                                                                                      animateFromLastPercent: true,
                                                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      center: Text(
                                                                                                                        '${usersReportsActivitiesProgressRowList.where((e) => (e.categID == columnCategRecord.reference.id) && (e.type == 'quran')).toList().first.grade?.toString()}%',
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                              fontFamily: 'Cairo',
                                                                                                                              fontSize: 19.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '6vdxabq2' /* القرآن */,
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
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }).divide(SizedBox(height: 50.0)),
                                                                          ),
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
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      columnCategRecord.name,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Cairo',
                                                                                            fontSize: 24.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    StreamBuilder<List<SupjRecord>>(
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
                                                                                                                  List<ActivitiesRecord> containerTestActivActivitiesRecordList = snapshot.data!;
                                                                                                                  return Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(14.0),
                                                                                                                    ),
                                                                                                                    child: Visibility(
                                                                                                                      visible: containerTestActivActivitiesRecordList.length >= 1,
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
                                                                                                                            if (usersReportsActivitiesProgressRowList.where((e) => e.activitID == containerTestActivActivitiesRecordList.first.reference.id).toList().first.grade! > 1.0) {
                                                                                                                              await ActivitiesProgressTable().update(
                                                                                                                                data: {
                                                                                                                                  'grade': 1.0,
                                                                                                                                },
                                                                                                                                matchingRows: (rows) => rows.eq(
                                                                                                                                  'ID',
                                                                                                                                  usersReportsActivitiesProgressRowList.where((e) => e.activitID == containerTestActivActivitiesRecordList.first.reference.id).toList().first.id,
                                                                                                                                ),
                                                                                                                              );

                                                                                                                              context.pushNamed(
                                                                                                                                'testContent',
                                                                                                                                queryParameters: {
                                                                                                                                  'testRef': serializeParam(
                                                                                                                                    testRefsActivitiesRecordList.first.reference,
                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                              );
                                                                                                                            } else {
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
                                                                                                                          }
                                                                                                                        },
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
                                                                                                                                      if ((containerTestActivActivitiesRecordList.length <= 0) || (usersReportsActivitiesProgressRowList.length <= 0))
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
                                                                                                                                              '3w6fssc9' /* 0% */,
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      if ((containerTestActivActivitiesRecordList.length >= 1) && (usersReportsActivitiesProgressRowList.length >= 1))
                                                                                                                                        CircularPercentIndicator(
                                                                                                                                          percent: usersReportsActivitiesProgressRowList.where((e) => e.activitID == containerTestActivActivitiesRecordList.first.reference.id).toList().first.grade! > 1.0 ? 1.0 : usersReportsActivitiesProgressRowList.where((e) => e.activitID == containerTestActivActivitiesRecordList.first.reference.id).toList().first.grade!,
                                                                                                                                          radius: 37.5,
                                                                                                                                          lineWidth: 12.0,
                                                                                                                                          animation: true,
                                                                                                                                          animateFromLastPercent: true,
                                                                                                                                          progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                                          center: Text(
                                                                                                                                            formatNumber(
                                                                                                                                              usersReportsActivitiesProgressRowList.where((e) => e.activitID == containerTestActivActivitiesRecordList.first.reference.id).toList().first.grade! > 1.0 ? 100.0 : (usersReportsActivitiesProgressRowList.where((e) => e.activitID == containerTestActivActivitiesRecordList.first.reference.id).toList().first.grade! * 100),
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
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ],
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
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          columnCategRecord.name,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Cairo',
                                                                                                fontSize: 24.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                        StreamBuilder<List<SupjRecord>>(
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
                                                                                                                          if (usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().length >= 1)
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
                                                                                                                                  usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().length.toString(),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Cairo',
                                                                                                                                        fontSize: 18.0,
                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                                Text(
                                                                                                                                  formatNumber(
                                                                                                                                    functions.sumList(usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().map((e) => e.grade).withoutNulls.toList()),
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
                                                                                                                            if (usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().length <= 0)
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
                                                                                                                                    '74yya3tn' /* 0% */,
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            if (usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().length >= 1)
                                                                                                                              CircularPercentIndicator(
                                                                                                                                percent: functions.attendanceGrade(usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().length.toDouble(), functions.sumList(usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().map((e) => e.grade).withoutNulls.toList()), 0.0)!,
                                                                                                                                radius: 37.5,
                                                                                                                                lineWidth: 12.0,
                                                                                                                                animation: true,
                                                                                                                                animateFromLastPercent: true,
                                                                                                                                progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                                center: Text(
                                                                                                                                  '${formatNumber(
                                                                                                                                    functions.attendanceGrade(usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().length.toDouble(), functions.sumList(usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().map((e) => e.grade).withoutNulls.toList()), 0.0)! * 100,
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
                                                                                        ),
                                                                                      ],
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
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          columnCategRecord.name,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Cairo',
                                                                                                fontSize: 24.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                        StreamBuilder<List<SupjRecord>>(
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
                                                                                                                          percent: functions.attendanceGrade(containerActivitiesRecordList.length.toDouble(), usersReportsActivitiesProgressRowList.where((e) => e.isSeen! && (e.supjID == columnSupjRecord.reference.id)).toList().length.toDouble(), usersReportsActivitiesProgressRowList.where((e) => e.isAttended! && (e.supjID == columnSupjRecord.reference.id)).toList().length.toDouble())!,
                                                                                                                          radius: 37.5,
                                                                                                                          lineWidth: 12.0,
                                                                                                                          animation: true,
                                                                                                                          animateFromLastPercent: true,
                                                                                                                          progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                          center: Text(
                                                                                                                            '${formatNumber(
                                                                                                                              functions.attendanceGrade(containerActivitiesRecordList.length.toDouble(), usersReportsActivitiesProgressRowList.where((e) => e.isSeen! && (e.supjID == columnSupjRecord.reference.id)).toList().length.toDouble(), usersReportsActivitiesProgressRowList.where((e) => e.isAttended! && (e.supjID == columnSupjRecord.reference.id)).toList().length.toDouble())! * 100,
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
                                                                                        ),
                                                                                      ],
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
                                                                                      child: Container(
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
                                                                                                  if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().length >= 1)
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Text(
                                                                                                        'الدرجة : ${usersReportsActivitiesProgressRowList.where((e) => (e.categID == columnCategRecord.reference.id) && (e.type == 'quran')).toList().first.grade?.toString()}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                      ),
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().length >= 1)
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    ),
                                                                                                    child: CircularPercentIndicator(
                                                                                                      percent: usersReportsActivitiesProgressRowList.where((e) => (e.categID == columnCategRecord.reference.id) && (e.type == 'quran')).toList().first.grade! / 100,
                                                                                                      radius: 37.5,
                                                                                                      lineWidth: 12.0,
                                                                                                      animation: true,
                                                                                                      animateFromLastPercent: true,
                                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      center: Text(
                                                                                                        '${usersReportsActivitiesProgressRowList.where((e) => (e.categID == columnCategRecord.reference.id) && (e.type == 'quran')).toList().first.grade?.toString()}%',
                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                              fontFamily: 'Cairo',
                                                                                                              fontSize: 19.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
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
