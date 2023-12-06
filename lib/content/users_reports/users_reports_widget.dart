import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'users_reports_model.dart';
export 'users_reports_model.dart';

class UsersReportsWidget extends StatefulWidget {
  const UsersReportsWidget({
    super.key,
    this.inspection,
    bool? reCalculate,
    this.categRefCalculate,
  })  : reCalculate = reCalculate ?? false;

  final DocumentReference? inspection;
  final bool reCalculate;
  final DocumentReference? categRefCalculate;

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
      if (!((currentUserDisplayName != '') &&
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
          (valueOrDefault(currentUserDocument?.telegram, '') != ''))) {
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
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.00, 1.00),
                                              child: Container(
                                                height: 900.0,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 700.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x320E151B),
                                                      offset: Offset(0.0, -2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      const BorderRadius.only(
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
                                                          const EdgeInsetsDirectional
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
                                                                    const AlignmentDirectional(
                                                                        -0.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
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
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final containerUsersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
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
                                                        ].divide(const SizedBox(
                                                            width: 5.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const Alignment(
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
                                                                    builder:
                                                                        (context) =>
                                                                            Card(
                                                                      clipBehavior:
                                                                          Clip.antiAliasWithSaveLayer,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      elevation:
                                                                          4.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
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
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
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
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(columnCategRecordList.length, (columnIndex) {
                                                                                final columnCategRecord = columnCategRecordList[columnIndex];
                                                                                return FutureBuilder<List<CategGradesRow>>(
                                                                                  future: CategGradesTable().queryRows(
                                                                                    queryFn: (q) => q
                                                                                        .eq(
                                                                                          'userREF',
                                                                                          currentUserReference?.id,
                                                                                        )
                                                                                        .eq(
                                                                                          'categID',
                                                                                          columnCategRecord.reference.id,
                                                                                        ),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: CircularProgressIndicator(
                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<CategGradesRow> cardCategGradesRowList = snapshot.data!;
                                                                                    return Card(
                                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      elevation: 4.0,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          if (cardCategGradesRowList.isNotEmpty) {
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  decoration: const BoxDecoration(),
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
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            child: CircularProgressIndicator(
                                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      List<SupjRecord> supjSupjRecordList = snapshot.data!;
                                                                                                      return Container(
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: StreamBuilder<List<ActivitiesRecord>>(
                                                                                                          stream: queryActivitiesRecord(
                                                                                                            queryBuilder: (activitiesRecord) => activitiesRecord.whereIn('supjRef', supjSupjRecordList.map((e) => e.reference).toList()),
                                                                                                          ),
                                                                                                          builder: (context, snapshot) {
                                                                                                            // Customize what your widget looks like when it's loading.
                                                                                                            if (!snapshot.hasData) {
                                                                                                              return Center(
                                                                                                                child: SizedBox(
                                                                                                                  width: 50.0,
                                                                                                                  height: 50.0,
                                                                                                                  child: CircularProgressIndicator(
                                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }
                                                                                                            List<ActivitiesRecord> activiActivitiesRecordList = snapshot.data!;
                                                                                                            return Container(
                                                                                                              decoration: const BoxDecoration(),
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
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                                                                                                                    width: 50.0,
                                                                                                                                    height: 50.0,
                                                                                                                                    child: CircularProgressIndicator(
                                                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                                                      ),
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
                                                                                                                                          width: 50.0,
                                                                                                                                          height: 50.0,
                                                                                                                                          child: CircularProgressIndicator(
                                                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    }
                                                                                                                                    List<ActivitiesProgressRow> containertestActivitiesProgressRowList = snapshot.data!;
                                                                                                                                    return Container(
                                                                                                                                      decoration: const BoxDecoration(),
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
                                                                                                                                                width: 50.0,
                                                                                                                                                height: 50.0,
                                                                                                                                                child: CircularProgressIndicator(
                                                                                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            );
                                                                                                                                          }
                                                                                                                                          List<ActivitiesProgressRow> containerAttendActivitiesProgressRowList = snapshot.data!;
                                                                                                                                          return Container(
                                                                                                                                            decoration: const BoxDecoration(),
                                                                                                                                            child: Container(
                                                                                                                                              decoration: const BoxDecoration(),
                                                                                                                                              child: Padding(
                                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                child: Column(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  children: [
                                                                                                                                                    if ((containerFinalsActivitiesProgressRowList.where((e) => e.isSeen!).toList().isEmpty) && (containerFinalsActivitiesProgressRowList.where((e) => e.isAttended!).toList().isEmpty))
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
                                                                                                                                                            'ft9wbvm6' /* 0% */,
                                                                                                                                                          ),
                                                                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    if ((containerFinalsActivitiesProgressRowList.where((e) => e.isSeen!).toList().isNotEmpty) || (containerFinalsActivitiesProgressRowList.where((e) => e.isAttended!).toList().isNotEmpty))
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
                                                                                                                                                        '07d3w0th' /* الاختبارات */,
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
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                                                                                                                  width: 50.0,
                                                                                                                                  height: 50.0,
                                                                                                                                  child: CircularProgressIndicator(
                                                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                                                    ),
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
                                                                                                                                decoration: const BoxDecoration(),
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isEmpty) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isEmpty))
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
                                                                                                                                                  'bayyg5ym' /* 0% */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isNotEmpty) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isNotEmpty))
                                                                                                                                            CircularPercentIndicator(
                                                                                                                                              percent: functions.attendanceGradeCopy(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().length.toDouble(), functions.sumList(containerActivitiesProgressRowList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().map((e) => e.grade).withoutNulls.toList()))!,
                                                                                                                                              radius: 37.5,
                                                                                                                                              lineWidth: 12.0,
                                                                                                                                              animation: true,
                                                                                                                                              animateFromLastPercent: true,
                                                                                                                                              progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                              backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                                              center: Text(
                                                                                                                                                '${formatNumber(
                                                                                                                                                  functions.attendanceGradeCopy(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().length.toDouble(), functions.sumList(containerActivitiesProgressRowList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().map((e) => e.grade).withoutNulls.toList()))! * 100,
                                                                                                                                                  formatType: FormatType.custom,
                                                                                                                                                  format: '#',
                                                                                                                                                  locale: '',
                                                                                                                                                )}%',
                                                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          Text(
                                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                                              'u6izaew9' /* الاختبارات */,
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'Cairo',
                                                                                                                                                  fontSize: 22.0,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                                                                                                                  width: 50.0,
                                                                                                                                  height: 50.0,
                                                                                                                                  child: CircularProgressIndicator(
                                                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                                                    ),
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
                                                                                                                                decoration: const BoxDecoration(),
                                                                                                                                child: Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isEmpty) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isEmpty))
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
                                                                                                                                              '669l87et' /* 0% */,
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isNotEmpty) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isNotEmpty))
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
                                                                                                                                          '2gi4514t' /* التدريبات */,
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
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                                                                                                                  width: 50.0,
                                                                                                                                  height: 50.0,
                                                                                                                                  child: CircularProgressIndicator(
                                                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                                                    ),
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
                                                                                                                                decoration: const BoxDecoration(),
                                                                                                                                child: Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isEmpty) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isEmpty))
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
                                                                                                                                              'hj06mch2' /* 0% */,
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isNotEmpty) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isNotEmpty))
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
                                                                                                                                          '4r0ldpyl' /* الحضور */,
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
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                        child: Container(
                                                                                                                          width: 100.0,
                                                                                                                          height: 130.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            borderRadius: BorderRadius.circular(18.0),
                                                                                                                          ),
                                                                                                                          child: Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().isEmpty)
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
                                                                                                                                        'xi7gzj3j' /* 0% */,
                                                                                                                                      ),
                                                                                                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                                            fontFamily: 'Cairo',
                                                                                                                                            fontSize: 19.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().isNotEmpty)
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
                                                                                                                                    '59bmmas1' /* القرآن */,
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
                                                                                          } else {
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      decoration: const BoxDecoration(),
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
                                                                                                                width: 50.0,
                                                                                                                height: 50.0,
                                                                                                                child: CircularProgressIndicator(
                                                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                          List<SupjRecord> supjSupjRecordList = snapshot.data!;
                                                                                                          return Container(
                                                                                                            decoration: const BoxDecoration(),
                                                                                                            child: StreamBuilder<List<ActivitiesRecord>>(
                                                                                                              stream: queryActivitiesRecord(
                                                                                                                queryBuilder: (activitiesRecord) => activitiesRecord.whereIn('supjRef', supjSupjRecordList.map((e) => e.reference).toList()),
                                                                                                              ),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 50.0,
                                                                                                                      height: 50.0,
                                                                                                                      child: CircularProgressIndicator(
                                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                List<ActivitiesRecord> activiActivitiesRecordList = snapshot.data!;
                                                                                                                return Container(
                                                                                                                  decoration: const BoxDecoration(),
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
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                                                                                                                        width: 50.0,
                                                                                                                                        height: 50.0,
                                                                                                                                        child: CircularProgressIndicator(
                                                                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                                          ),
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
                                                                                                                                              width: 50.0,
                                                                                                                                              height: 50.0,
                                                                                                                                              child: CircularProgressIndicator(
                                                                                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          );
                                                                                                                                        }
                                                                                                                                        List<ActivitiesProgressRow> containertestActivitiesProgressRowList = snapshot.data!;
                                                                                                                                        return Container(
                                                                                                                                          decoration: const BoxDecoration(),
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
                                                                                                                                                    width: 50.0,
                                                                                                                                                    height: 50.0,
                                                                                                                                                    child: CircularProgressIndicator(
                                                                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                );
                                                                                                                                              }
                                                                                                                                              List<ActivitiesProgressRow> containerAttendActivitiesProgressRowList = snapshot.data!;
                                                                                                                                              return Container(
                                                                                                                                                decoration: const BoxDecoration(),
                                                                                                                                                child: Container(
                                                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                    child: Column(
                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                      children: [
                                                                                                                                                        if ((containerFinalsActivitiesProgressRowList.where((e) => e.isSeen!).toList().isEmpty) && (containerFinalsActivitiesProgressRowList.where((e) => e.isAttended!).toList().isEmpty))
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
                                                                                                                                                                '32u5qlo3' /* 0% */,
                                                                                                                                                              ),
                                                                                                                                                              style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        if ((containerFinalsActivitiesProgressRowList.where((e) => e.isSeen!).toList().isNotEmpty) || (containerFinalsActivitiesProgressRowList.where((e) => e.isAttended!).toList().isNotEmpty))
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
                                                                                                                                                            'dxvm4q7f' /* الاختبارات */,
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
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                                                                                                                      width: 50.0,
                                                                                                                                      height: 50.0,
                                                                                                                                      child: CircularProgressIndicator(
                                                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }
                                                                                                                                List<ActivitiesProgressRow> containerActivitiesProgressRowList = snapshot.data!;
                                                                                                                                return Container(
                                                                                                                                  width: 100.0,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                                                  ),
                                                                                                                                  child: Container(
                                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                                    child: Column(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Padding(
                                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            children: [
                                                                                                                                              if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isEmpty) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isEmpty))
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
                                                                                                                                                      'zkn9tcus' /* 0% */,
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isNotEmpty) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isNotEmpty))
                                                                                                                                                CircularPercentIndicator(
                                                                                                                                                  percent: functions.attendanceGradeCopy(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().length.toDouble(), functions.sumList(containerActivitiesProgressRowList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().map((e) => e.grade).withoutNulls.toList()))!,
                                                                                                                                                  radius: 37.5,
                                                                                                                                                  lineWidth: 12.0,
                                                                                                                                                  animation: true,
                                                                                                                                                  animateFromLastPercent: true,
                                                                                                                                                  progressColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                                                                                  center: Text(
                                                                                                                                                    '${formatNumber(
                                                                                                                                                      functions.attendanceGradeCopy(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().length.toDouble(), functions.sumList(containerActivitiesProgressRowList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().map((e) => e.grade).withoutNulls.toList()))! * 100,
                                                                                                                                                      formatType: FormatType.custom,
                                                                                                                                                      format: '#',
                                                                                                                                                      locale: '',
                                                                                                                                                    )}%',
                                                                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              FutureBuilder<List<CategGradesRow>>(
                                                                                                                                                future: (_model.requestCompleter ??= Completer<List<CategGradesRow>>()
                                                                                                                                                      ..complete(CategGradesTable().queryRows(
                                                                                                                                                        queryFn: (q) => q
                                                                                                                                                            .eq(
                                                                                                                                                              'userREF',
                                                                                                                                                              currentUserReference?.id,
                                                                                                                                                            )
                                                                                                                                                            .eq(
                                                                                                                                                              'categID',
                                                                                                                                                              columnCategRecord.reference.id,
                                                                                                                                                            ),
                                                                                                                                                      )))
                                                                                                                                                    .future,
                                                                                                                                                builder: (context, snapshot) {
                                                                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                                                                  if (!snapshot.hasData) {
                                                                                                                                                    return Center(
                                                                                                                                                      child: SizedBox(
                                                                                                                                                        width: 50.0,
                                                                                                                                                        height: 50.0,
                                                                                                                                                        child: CircularProgressIndicator(
                                                                                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    );
                                                                                                                                                  }
                                                                                                                                                  List<CategGradesRow> cardtestCategGradesRowList = snapshot.data!;
                                                                                                                                                  return Card(
                                                                                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                    elevation: 4.0,
                                                                                                                                                    shape: RoundedRectangleBorder(
                                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                    ),
                                                                                                                                                    child: Column(
                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                      children: [
                                                                                                                                                        if (valueOrDefault<int>(
                                                                                                                                                              cardtestCategGradesRowList.length,
                                                                                                                                                              0,
                                                                                                                                                            ) >=
                                                                                                                                                            1)
                                                                                                                                                          Text(
                                                                                                                                                            valueOrDefault<String>(
                                                                                                                                                              cardtestCategGradesRowList.first.gpa,
                                                                                                                                                              '0',
                                                                                                                                                            ),
                                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                                  fontFamily: 'Cairo',
                                                                                                                                                                  fontSize: 22.0,
                                                                                                                                                                ),
                                                                                                                                                          ),
                                                                                                                                                        if (valueOrDefault<int>(
                                                                                                                                                              cardtestCategGradesRowList.length,
                                                                                                                                                              0,
                                                                                                                                                            ) <
                                                                                                                                                            1)
                                                                                                                                                          FFButtonWidget(
                                                                                                                                                            onPressed: () async {
                                                                                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                                                SnackBar(
                                                                                                                                                                  content: Text(
                                                                                                                                                                    'start',
                                                                                                                                                                    style: TextStyle(
                                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                    ),
                                                                                                                                                                  ),
                                                                                                                                                                  duration: const Duration(milliseconds: 4000),
                                                                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                                ),
                                                                                                                                                              );
                                                                                                                                                              await CategGradesTable().insert({
                                                                                                                                                                'GPA': functions.attendanceGradeCopy(activiActivitiesRecordList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().length.toDouble(), functions.sumList(containerActivitiesProgressRowList.where((e) => (e.type == 'test') && (e.isFinal == true)).toList().map((e) => e.grade).withoutNulls.toList()))?.toString(),
                                                                                                                                                                'categID': columnCategRecord.reference.id,
                                                                                                                                                                'userREF': currentUserReference?.id,
                                                                                                                                                                'UID': currentUserUid,
                                                                                                                                                              });
                                                                                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                                                SnackBar(
                                                                                                                                                                  content: Text(
                                                                                                                                                                    'done',
                                                                                                                                                                    style: TextStyle(
                                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                    ),
                                                                                                                                                                  ),
                                                                                                                                                                  duration: const Duration(milliseconds: 4000),
                                                                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                                ),
                                                                                                                                                              );
                                                                                                                                                              setState(() => _model.requestCompleter = null);
                                                                                                                                                              await _model.waitForRequestCompleted();
                                                                                                                                                            },
                                                                                                                                                            text: FFLocalizations.of(context).getText(
                                                                                                                                                              'svbotqzw' /* Button */,
                                                                                                                                                            ),
                                                                                                                                                            options: FFButtonOptions(
                                                                                                                                                              height: 40.0,
                                                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                                                    fontFamily: 'Cairo',
                                                                                                                                                                    color: Colors.white,
                                                                                                                                                                  ),
                                                                                                                                                              elevation: 3.0,
                                                                                                                                                              borderSide: const BorderSide(
                                                                                                                                                                color: Colors.transparent,
                                                                                                                                                                width: 1.0,
                                                                                                                                                              ),
                                                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                      ],
                                                                                                                                                    ),
                                                                                                                                                  );
                                                                                                                                                },
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                                                                                                                      width: 50.0,
                                                                                                                                      height: 50.0,
                                                                                                                                      child: CircularProgressIndicator(
                                                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                                        ),
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
                                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isEmpty) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isEmpty))
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
                                                                                                                                                  '787i78sj' /* 0% */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isNotEmpty) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isNotEmpty))
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
                                                                                                                                              'ho7ylym6' /* التدريبات */,
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
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                                                                                                                                      width: 50.0,
                                                                                                                                      height: 50.0,
                                                                                                                                      child: CircularProgressIndicator(
                                                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                                        ),
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
                                                                                                                                    decoration: const BoxDecoration(),
                                                                                                                                    child: Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                      child: Column(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isEmpty) && (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isEmpty))
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
                                                                                                                                                  'lv3vlrbm' /* 0% */,
                                                                                                                                                ),
                                                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          if ((containerActivitiesProgressRowList.where((e) => e.isSeen!).toList().isNotEmpty) || (containerActivitiesProgressRowList.where((e) => e.isAttended!).toList().isNotEmpty))
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
                                                                                                                                              'm3thpohs' /* الحضور */,
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
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                            child: Container(
                                                                                                                              width: 100.0,
                                                                                                                              height: 130.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                borderRadius: BorderRadius.circular(18.0),
                                                                                                                              ),
                                                                                                                              child: Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().isEmpty)
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
                                                                                                                                            'e3vnrrtd' /* 0% */,
                                                                                                                                          ),
                                                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                                                fontFamily: 'Cairo',
                                                                                                                                                fontSize: 19.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().isNotEmpty)
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
                                                                                                                                        'dvueqyjz' /* القرآن */,
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
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }).divide(const SizedBox(height: 50.0)),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  KeepAliveWidgetWrapper(
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
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
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
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
                                                                                              width: 50.0,
                                                                                              height: 50.0,
                                                                                              child: CircularProgressIndicator(
                                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                                ),
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
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      child: CircularProgressIndicator(
                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<ActivitiesRecord> testRefsActivitiesRecordList = snapshot.data!;
                                                                                                return Container(
                                                                                                  decoration: const BoxDecoration(),
                                                                                                  child: Visibility(
                                                                                                    visible: testRefsActivitiesRecordList.isNotEmpty,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Flexible(
                                                                                                          child: Container(
                                                                                                            decoration: const BoxDecoration(),
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                                                                        width: 50.0,
                                                                                                                        height: 50.0,
                                                                                                                        child: CircularProgressIndicator(
                                                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                                          ),
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
                                                                                                                      visible: containerTestActivActivitiesRecordList.isNotEmpty,
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
                                                                                                                                    title: const Text('تنبيه'),
                                                                                                                                    content: const Text('هذا الاختبار نهائي ولا يحتوي إلا على محاولة واحدة ..... هل تريد الاستمرار'),
                                                                                                                                    actions: [
                                                                                                                                      TextButton(
                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                        child: const Text('خروج'),
                                                                                                                                      ),
                                                                                                                                      TextButton(
                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                        child: const Text('استمرار'),
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
                                                                                                                                  'categRef': serializeParam(
                                                                                                                                    columnSupjRecord.supCateg,
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
                                                                                                                                  'categRef': serializeParam(
                                                                                                                                    columnSupjRecord.supCateg,
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
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                                                                                      if ((containerTestActivActivitiesRecordList.isEmpty) || (usersReportsActivitiesProgressRowList.isEmpty))
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
                                                                                                                                      if ((containerTestActivActivitiesRecordList.isNotEmpty) && (usersReportsActivitiesProgressRowList.isNotEmpty))
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
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<ActivitiesRecord>
                                                                            containerActivitiesRecordList =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          decoration:
                                                                              const BoxDecoration(),
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
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
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
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: CircularProgressIndicator(
                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                    ),
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
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    child: CircularProgressIndicator(
                                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                                      ),
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
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                                                                          if (usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().isNotEmpty)
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
                                                                                                                              ].divide(const SizedBox(width: 10.0)),
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
                                                                                                                            if (usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().isEmpty)
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
                                                                                                                            if (usersReportsActivitiesProgressRowList.where((e) => e.supjID == columnSupjRecord.reference.id).toList().isNotEmpty)
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
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<CategRecord>
                                                                            containerCategRecordList =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          decoration:
                                                                              const BoxDecoration(),
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
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
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
                                                                                                  width: 50.0,
                                                                                                  height: 50.0,
                                                                                                  child: CircularProgressIndicator(
                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                    ),
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
                                                                                                        decoration: const BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    child: CircularProgressIndicator(
                                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                                      ),
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
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
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
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
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
                                                                                                  if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().isNotEmpty)
                                                                                                    Container(
                                                                                                      decoration: const BoxDecoration(),
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
                                                                                                if (usersReportsActivitiesProgressRowList.where((e) => e.categID == columnCategRecord.reference.id).toList().isNotEmpty)
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
