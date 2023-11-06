import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'course_content_model.dart';
export 'course_content_model.dart';

class CourseContentWidget extends StatefulWidget {
  const CourseContentWidget({
    super.key,
    this.output,
    required this.courseRef,
  });

  final bool? output;
  final DocumentReference? courseRef;

  @override
  _CourseContentWidgetState createState() => _CourseContentWidgetState();
}

class _CourseContentWidgetState extends State<CourseContentWidget>
    with TickerProviderStateMixin {
  late CourseContentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(50.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(50.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(50.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseContentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
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
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return StreamBuilder<SupjRecord>(
      stream: SupjRecord.getDocument(widget.courseRef!),
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
        final courseContentSupjRecord = snapshot.data!;
        return Title(
            title: 'courseContent',
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
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.00, 1.00),
                                                  child: Container(
                                                    height: 900.0,
                                                    constraints: const BoxConstraints(
                                                      maxWidth: 700.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x320E151B),
                                                          offset:
                                                              Offset(0.0, -2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        topRight:
                                                            Radius.circular(
                                                                16.0),
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
                                                                MainAxisSize
                                                                    .max,
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
                                                                onTap:
                                                                    () async {
                                                                  context.pushNamed(
                                                                      'coursesMainP');
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            14.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -0.00,
                                                                            0.00),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'xvpj48zs' /* المقررات */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Cairo',
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      5.0,
                                                                      16.0,
                                                                      0.0),
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
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    courseContentSupjRecord
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      courseContentSupjRecord
                                                                          .teacherString,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
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
                                                                          0.0,
                                                                          0),
                                                                  child: TabBar(
                                                                    isScrollable:
                                                                        true,
                                                                    labelColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    unselectedLabelColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    labelStyle:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMedium,
                                                                    unselectedLabelStyle:
                                                                        const TextStyle(),
                                                                    indicatorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    tabs: [
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'r7h5h8wh' /* الدروس */,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          't4rn0ee6' /* التدريبات */,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'rtk1fs2i' /* المرفقات */,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'fnf1fc50' /* نظرة عامة */,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                    controller:
                                                                        _model
                                                                            .tabBarController,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      TabBarView(
                                                                    controller:
                                                                        _model
                                                                            .tabBarController,
                                                                    children: [
                                                                      KeepAliveWidgetWrapper(
                                                                        builder:
                                                                            (context) =>
                                                                                Stack(
                                                                          children: [
                                                                            StreamBuilder<List<ActivitiesRecord>>(
                                                                              stream: queryActivitiesRecord(
                                                                                queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                    .where(
                                                                                      'type',
                                                                                      isEqualTo: 'lesson',
                                                                                    )
                                                                                    .where(
                                                                                      'supjRef',
                                                                                      isEqualTo: widget.courseRef,
                                                                                    )
                                                                                    .orderBy('order'),
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
                                                                                List<ActivitiesRecord> lesonColumnActivitiesRecordList = snapshot.data!;
                                                                                return SingleChildScrollView(
                                                                                  primary: false,
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(lesonColumnActivitiesRecordList.length, (lesonColumnIndex) {
                                                                                      final lesonColumnActivitiesRecord = lesonColumnActivitiesRecordList[lesonColumnIndex];
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  context.pushNamed(
                                                                                                    'lessonContent',
                                                                                                    queryParameters: {
                                                                                                      'activiRef': serializeParam(
                                                                                                        lesonColumnActivitiesRecord.reference,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                },
                                                                                                child: Material(
                                                                                                  color: Colors.transparent,
                                                                                                  elevation: 20.0,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                                  ),
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 100.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      boxShadow: const [
                                                                                                        BoxShadow(
                                                                                                          blurRadius: 4.0,
                                                                                                          color: Color(0x230E151B),
                                                                                                          offset: Offset(0.0, 2.0),
                                                                                                        )
                                                                                                      ],
                                                                                                      borderRadius: BorderRadius.circular(18.0),
                                                                                                    ),
                                                                                                    child: Stack(
                                                                                                      children: [
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(18.0),
                                                                                                          child: Image.asset(
                                                                                                            'assets/images/32318401_7922058.jpg',
                                                                                                            width: 120.0,
                                                                                                            height: 100.0,
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: const AlignmentDirectional(-0.90, 0.85),
                                                                                                          child: Container(
                                                                                                            width: 32.0,
                                                                                                            height: 32.0,
                                                                                                            decoration: const BoxDecoration(
                                                                                                              color: Colors.white,
                                                                                                              boxShadow: [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 4.0,
                                                                                                                  color: Color(0x230E151B),
                                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                                )
                                                                                                              ],
                                                                                                              shape: BoxShape.circle,
                                                                                                            ),
                                                                                                            child: const Icon(
                                                                                                              Icons.play_arrow_rounded,
                                                                                                              color: Color(0xFF14181B),
                                                                                                              size: 20.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(130.0, 0.0, 12.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    '${lesonColumnActivitiesRecord.order.toString()} - ${lesonColumnActivitiesRecord.name}',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                          fontFamily: 'Readex Pro',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 16.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                    child: Text(
                                                                                                                      '${lesonColumnActivitiesRecord.time} دقيقة',
                                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                            fontFamily: 'Readex Pro',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            fontSize: 12.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(40.0),
                                                                                                                        child: Image.network(
                                                                                                                          'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                                                                                                          width: 32.0,
                                                                                                                          height: 32.0,
                                                                                                                          fit: BoxFit.cover,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          lesonColumnActivitiesRecord.teacher,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                fontSize: 14.0,
                                                                                                                                fontWeight: FontWeight.w500,
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
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    }),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      KeepAliveWidgetWrapper(
                                                                        builder:
                                                                            (context) =>
                                                                                StreamBuilder<List<ActivitiesRecord>>(
                                                                          stream:
                                                                              queryActivitiesRecord(
                                                                            queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                .where(
                                                                                  'type',
                                                                                  isEqualTo: 'test',
                                                                                )
                                                                                .where(
                                                                                  'supjRef',
                                                                                  isEqualTo: widget.courseRef,
                                                                                )
                                                                                .where(
                                                                                  'visibility',
                                                                                  isEqualTo: true,
                                                                                )
                                                                                .orderBy('order'),
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
                                                                            List<ActivitiesRecord>
                                                                                testColumnActivitiesRecordList =
                                                                                snapshot.data!;
                                                                            if (testColumnActivitiesRecordList.isEmpty) {
                                                                              return Image.asset(
                                                                                'assets/images/5928294_3009287.jpg',
                                                                              );
                                                                            }
                                                                            return SingleChildScrollView(
                                                                              primary: false,
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(testColumnActivitiesRecordList.length, (testColumnIndex) {
                                                                                  final testColumnActivitiesRecord = testColumnActivitiesRecordList[testColumnIndex];
                                                                                  return Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: FutureBuilder<List<ActivitiesProgressRow>>(
                                                                                          future: ActivitiesProgressTable().queryRows(
                                                                                            queryFn: (q) => q
                                                                                                .eq(
                                                                                                  'userID',
                                                                                                  currentUserUid,
                                                                                                )
                                                                                                .eq(
                                                                                                  'activitID',
                                                                                                  testColumnActivitiesRecord.reference.id,
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
                                                                                            List<ActivitiesProgressRow> testAttemptActivitiesProgressRowList = snapshot.data!;
                                                                                            return Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                                  child: StreamBuilder<List<QbankRecord>>(
                                                                                                    stream: queryQbankRecord(
                                                                                                      queryBuilder: (qbankRecord) => qbankRecord.where(
                                                                                                        'activid',
                                                                                                        isEqualTo: testColumnActivitiesRecord.reference,
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
                                                                                                      List<QbankRecord> testCardQbankRecordList = snapshot.data!;
                                                                                                      return InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          context.pushNamed(
                                                                                                            'testContent',
                                                                                                            queryParameters: {
                                                                                                              'testRef': serializeParam(
                                                                                                                testColumnActivitiesRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );

                                                                                                          if (testAttemptActivitiesProgressRowList.first.grade! > 1.0) {
                                                                                                            await ActivitiesProgressTable().update(
                                                                                                              data: {
                                                                                                                'grade': 1.0,
                                                                                                              },
                                                                                                              matchingRows: (rows) => rows.eq(
                                                                                                                'ID',
                                                                                                                testAttemptActivitiesProgressRowList.first.id,
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                        child: Material(
                                                                                                          color: Colors.transparent,
                                                                                                          elevation: 20.0,
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(18.0),
                                                                                                          ),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 130.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              boxShadow: const [
                                                                                                                BoxShadow(
                                                                                                                  blurRadius: 4.0,
                                                                                                                  color: Color(0x230E151B),
                                                                                                                  offset: Offset(0.0, 2.0),
                                                                                                                )
                                                                                                              ],
                                                                                                              borderRadius: BorderRadius.circular(18.0),
                                                                                                            ),
                                                                                                            child: Stack(
                                                                                                              children: [
                                                                                                                ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/testjpj.jpg',
                                                                                                                    width: 120.0,
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: const AlignmentDirectional(-0.90, 0.85),
                                                                                                                  child: Container(
                                                                                                                    width: 32.0,
                                                                                                                    height: 32.0,
                                                                                                                    decoration: const BoxDecoration(
                                                                                                                      color: Colors.white,
                                                                                                                      boxShadow: [
                                                                                                                        BoxShadow(
                                                                                                                          blurRadius: 4.0,
                                                                                                                          color: Color(0x230E151B),
                                                                                                                          offset: Offset(0.0, 2.0),
                                                                                                                        )
                                                                                                                      ],
                                                                                                                      shape: BoxShape.circle,
                                                                                                                    ),
                                                                                                                    child: const Align(
                                                                                                                      alignment: AlignmentDirectional(-0.00, 0.00),
                                                                                                                      child: FaIcon(
                                                                                                                        FontAwesomeIcons.clipboardCheck,
                                                                                                                        color: Color(0xFF14181B),
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(130.0, 0.0, 12.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                testColumnActivitiesRecord.name,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 16.0,
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                                child: Text(
                                                                                                                                  'عدد الأسئلة : ${testCardQbankRecordList.length.toString()}',
                                                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                        fontFamily: 'Readex Pro',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        fontSize: 12.0,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                                child: Text(
                                                                                                                                  'الوقت : ${testColumnActivitiesRecord.howLong.toString()}',
                                                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                        fontFamily: 'Readex Pro',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        fontSize: 12.0,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                                child: Text(
                                                                                                                                  'المحاولات : ${testColumnActivitiesRecord.howMany.toString()}',
                                                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                        fontFamily: 'Readex Pro',
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                        fontSize: 12.0,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Stack(
                                                                                                                                children: [
                                                                                                                                  Icon(
                                                                                                                                    Icons.done_all_outlined,
                                                                                                                                    color: testAttemptActivitiesProgressRowList.isNotEmpty ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
                                                                                                                                    size: 40.0,
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!);
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
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
                                                                      KeepAliveWidgetWrapper(
                                                                        builder:
                                                                            (context) =>
                                                                                StreamBuilder<List<ActivitiesRecord>>(
                                                                          stream:
                                                                              queryActivitiesRecord(
                                                                            queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                .where(
                                                                                  'type',
                                                                                  isEqualTo: 'docs',
                                                                                )
                                                                                .where(
                                                                                  'supjRef',
                                                                                  isEqualTo: widget.courseRef,
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
                                                                            List<ActivitiesRecord>
                                                                                docsColumnActivitiesRecordList =
                                                                                snapshot.data!;
                                                                            if (docsColumnActivitiesRecordList.isEmpty) {
                                                                              return Image.asset(
                                                                                'assets/images/5928294_3009287.jpg',
                                                                              );
                                                                            }
                                                                            return SingleChildScrollView(
                                                                              primary: false,
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(docsColumnActivitiesRecordList.length, (docsColumnIndex) {
                                                                                  final docsColumnActivitiesRecord = docsColumnActivitiesRecordList[docsColumnIndex];
                                                                                  return Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await launchURL(docsColumnActivitiesRecord.doc);
                                                                                            },
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 20.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(18.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  boxShadow: const [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 4.0,
                                                                                                      color: Color(0x230E151B),
                                                                                                      offset: Offset(0.0, 2.0),
                                                                                                    )
                                                                                                  ],
                                                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                                                ),
                                                                                                child: Stack(
                                                                                                  children: [
                                                                                                    ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(18.0),
                                                                                                      child: Image.asset(
                                                                                                        'assets/images/10117878_4351368.jpg',
                                                                                                        width: 120.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: const AlignmentDirectional(-0.90, 0.85),
                                                                                                      child: Container(
                                                                                                        width: 32.0,
                                                                                                        height: 32.0,
                                                                                                        decoration: const BoxDecoration(
                                                                                                          color: Colors.white,
                                                                                                          boxShadow: [
                                                                                                            BoxShadow(
                                                                                                              blurRadius: 4.0,
                                                                                                              color: Color(0x230E151B),
                                                                                                              offset: Offset(0.0, 2.0),
                                                                                                            )
                                                                                                          ],
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: const Icon(
                                                                                                          Icons.attach_file,
                                                                                                          color: Color(0xFF14181B),
                                                                                                          size: 20.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(130.0, 16.0, 12.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    '${docsColumnActivitiesRecord.order.toString()} - ${docsColumnActivitiesRecord.name}',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                          fontFamily: 'Readex Pro',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 16.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    'نوع الملف : ${docsColumnActivitiesRecord.docsType}',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                          fontFamily: 'Readex Pro',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 16.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Icon(
                                                                                                                    Icons.cloud_download,
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    size: 40.0,
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
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
                                                                      KeepAliveWidgetWrapper(
                                                                        builder:
                                                                            (context) =>
                                                                                Container(),
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
