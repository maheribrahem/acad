import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lesson_content_model.dart';
export 'lesson_content_model.dart';

class LessonContentWidget extends StatefulWidget {
  const LessonContentWidget({
    Key? key,
    required this.activiRef,
    this.lessonsCount,
  }) : super(key: key);

  final DocumentReference? activiRef;
  final List<DocumentReference>? lessonsCount;

  @override
  _LessonContentWidgetState createState() => _LessonContentWidgetState();
}

class _LessonContentWidgetState extends State<LessonContentWidget>
    with TickerProviderStateMixin {
  late LessonContentModel _model;

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
          begin: Offset(50.0, 0.0),
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
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
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
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonContentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });

    _model.audioVideoController ??= TextEditingController();
    _model.audioVideoFocusNode ??= FocusNode();

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.audioVideoController?.text =
              FFLocalizations.of(context).getText(
            'o8f6mre5' /* audio */,
          );
        }));
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

    return StreamBuilder<ActivitiesRecord>(
      stream: ActivitiesRecord.getDocument(widget.activiRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
        final lessonContentActivitiesRecord = snapshot.data!;
        return YoutubeFullScreenWrapper(
          child: Title(
              title: 'lessonContent',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Scaffold(
                  key: scaffoldKey,
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
                                          scaffoldKey.currentState!
                                              .openDrawer();
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
                                            0.0, 20.0, 0.0, 0.0),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 1.00),
                                                  child: Container(
                                                    height: 900.0,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 700.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x320E151B),
                                                          offset:
                                                              Offset(0.0, -2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
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
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              SupjRecord>(
                                                            stream: SupjRecord
                                                                .getDocument(
                                                                    lessonContentActivitiesRecord
                                                                        .supjRef!),
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          100.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final rowSupjRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
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
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(24.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(24.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.00,
                                                                            0.00),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'fg69f524' /* المقررات */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Cairo',
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'courseContent',
                                                                        queryParameters:
                                                                            {
                                                                          'courseRef':
                                                                              serializeParam(
                                                                            rowSupjRecord.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(24.0),
                                                                          bottomRight:
                                                                              Radius.circular(8.0),
                                                                          topLeft:
                                                                              Radius.circular(24.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.00,
                                                                            0.00),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            rowSupjRecord.name,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Cairo',
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              14.0),
                                                                    ),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            ActivitiesRecord>>(
                                                                      stream:
                                                                          queryActivitiesRecord(
                                                                        queryBuilder: (activitiesRecord) => activitiesRecord
                                                                            .where(
                                                                              'supjRef',
                                                                              isEqualTo: lessonContentActivitiesRecord.supjRef,
                                                                            )
                                                                            .where(
                                                                              'order',
                                                                              isEqualTo: functions.decrementOrder(lessonContentActivitiesRecord.order),
                                                                            ),
                                                                        singleRecord:
                                                                            true,
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
                                                                            previousActivitiesRecordList =
                                                                            snapshot.data!;
                                                                        final previousActivitiesRecord = previousActivitiesRecordList.isNotEmpty
                                                                            ? previousActivitiesRecordList.first
                                                                            : null;
                                                                        return InkWell(
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
                                                                            if (previousActivitiesRecord?.order !=
                                                                                0) {
                                                                              context.pushNamed(
                                                                                'lessonContent',
                                                                                queryParameters: {
                                                                                  'activiRef': serializeParam(
                                                                                    previousActivitiesRecord?.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              setState(() {});
                                                                            }
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.skip_next_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  FutureBuilder<
                                                                      int>(
                                                                    future:
                                                                        queryActivitiesRecordCount(
                                                                      queryBuilder: (activitiesRecord) => activitiesRecord
                                                                          .where(
                                                                            'supjRef',
                                                                            isEqualTo:
                                                                                lessonContentActivitiesRecord.supjRef,
                                                                          )
                                                                          .where(
                                                                            'type',
                                                                            isEqualTo:
                                                                                'lesson',
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
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            child:
                                                                                SpinKitSquareCircle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 100.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      int textCount =
                                                                          snapshot
                                                                              .data!;
                                                                      return Text(
                                                                        '${lessonContentActivitiesRecord.order.toString()} من ${textCount.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  FutureBuilder<
                                                                      int>(
                                                                    future:
                                                                        queryActivitiesRecordCount(
                                                                      queryBuilder:
                                                                          (activitiesRecord) =>
                                                                              activitiesRecord.where(
                                                                        'supjRef',
                                                                        isEqualTo:
                                                                            lessonContentActivitiesRecord.supjRef,
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
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            child:
                                                                                SpinKitSquareCircle(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 100.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      int nextttCount =
                                                                          snapshot
                                                                              .data!;
                                                                      return Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(14.0),
                                                                        ),
                                                                        child: StreamBuilder<
                                                                            List<ActivitiesRecord>>(
                                                                          stream:
                                                                              queryActivitiesRecord(
                                                                            queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                .where(
                                                                                  'supjRef',
                                                                                  isEqualTo: lessonContentActivitiesRecord.supjRef,
                                                                                )
                                                                                .where(
                                                                                  'order',
                                                                                  isEqualTo: functions.incrementOrder(lessonContentActivitiesRecord.order),
                                                                                ),
                                                                            singleRecord:
                                                                                true,
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
                                                                                nextActivitiesRecordList =
                                                                                snapshot.data!;
                                                                            final nextActivitiesRecord = nextActivitiesRecordList.isNotEmpty
                                                                                ? nextActivitiesRecordList.first
                                                                                : null;
                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (nextActivitiesRecord!.order < nextttCount) {
                                                                                  setState(() {});
                                                                                  setState(() {
                                                                                    _model.audioVideoController?.text = FFLocalizations.of(context).getText(
                                                                                      'o8f6mre5' /* audio */,
                                                                                    );
                                                                                  });

                                                                                  context.pushNamed(
                                                                                    'lessonContent',
                                                                                    queryParameters: {
                                                                                      'activiRef': serializeParam(
                                                                                        nextActivitiesRecord?.reference,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                }
                                                                              },
                                                                              child: Icon(
                                                                                Icons.skip_previous_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 30.0,
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (lessonContentActivitiesRecord
                                                                            .video !=
                                                                        null &&
                                                                    lessonContentActivitiesRecord
                                                                            .video !=
                                                                        '')
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .audioVideoController
                                                                            ?.text = 'video';
                                                                      });
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .ondemand_video,
                                                                      color: _model.audioVideoController.text ==
                                                                              'video'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      size:
                                                                          35.0,
                                                                    ),
                                                                  ),
                                                                if (lessonContentActivitiesRecord
                                                                            .audio !=
                                                                        null &&
                                                                    lessonContentActivitiesRecord
                                                                            .audio !=
                                                                        '')
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .audioVideoController
                                                                            ?.text = 'audio';
                                                                      });
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .graphic_eq,
                                                                      color: _model.audioVideoController.text ==
                                                                              'audio'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      size:
                                                                          35.0,
                                                                    ),
                                                                  ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.audioVideoController,
                                                                        focusNode:
                                                                            _model.audioVideoFocusNode,
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'gr51sy0m' /* Label here... */,
                                                                          ),
                                                                          labelStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          hintStyle:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .audioVideoControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          5.0))
                                                                  .around(SizedBox(
                                                                      width:
                                                                          5.0)),
                                                            ),
                                                            if ((lessonContentActivitiesRecord
                                                                            .audio !=
                                                                        null &&
                                                                    lessonContentActivitiesRecord
                                                                            .audio !=
                                                                        '') &&
                                                                (_model.audioVideoController
                                                                        .text ==
                                                                    'audio'))
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 10.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        640.0,
                                                                    maxHeight:
                                                                        350.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child: StreamBuilder<
                                                                            List<ActivitiesRecord>>(
                                                                          stream:
                                                                              queryActivitiesRecord(
                                                                            queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                .where(
                                                                                  'type',
                                                                                  isEqualTo: 'lesson',
                                                                                )
                                                                                .where(
                                                                                  'supjRef',
                                                                                  isEqualTo: lessonContentActivitiesRecord.supjRef,
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
                                                                                containerActivitiesRecordList =
                                                                                snapshot.data!;
                                                                            return Container(
                                                                              height: 300.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 5.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                  child: custom_widgets.AdvanceMusicPlayer(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                    initialUrl: containerActivitiesRecordList.first.audio,
                                                                                    sliderActiveColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    sliderInactiveColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    backwardIconPath: FaIcon(
                                                                                      FontAwesomeIcons.stepBackward,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    forwardIconPath: FaIcon(
                                                                                      FontAwesomeIcons.stepForward,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    backwardIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    forwardIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    pauseIconPath: FaIcon(
                                                                                      FontAwesomeIcons.pause,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    playIconPath: FaIcon(
                                                                                      FontAwesomeIcons.play,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    pauseIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    playIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    loopIconPath: FaIcon(
                                                                                      FontAwesomeIcons.retweet,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    loopIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    shuffleIconPath: Icon(
                                                                                      Icons.shuffle,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    shuffleIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    playbackDurationTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    previousIconPath: FaIcon(
                                                                                      FontAwesomeIcons.backward,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    nextIconPath: FaIcon(
                                                                                      FontAwesomeIcons.forward,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    previousIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    nextIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    loopIconPressedPath: FaIcon(
                                                                                      FontAwesomeIcons.retweet,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    shuffleIconPressedPath: Icon(
                                                                                      Icons.shuffle,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    speakerOnIconPath: Icon(
                                                                                      Icons.speaker,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    speakerOffIconPath: Icon(
                                                                                      Icons.speaker_outlined,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    speakerOnIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    speakerOffIconColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    dropdownTextColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    timerIcon: Icon(
                                                                                      Icons.timer,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 40.0,
                                                                                    ),
                                                                                    musicUrls: containerActivitiesRecordList.map((e) => e.audio).toList(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((lessonContentActivitiesRecord
                                                                            .video !=
                                                                        null &&
                                                                    lessonContentActivitiesRecord
                                                                            .video !=
                                                                        '') &&
                                                                (_model.audioVideoController
                                                                        .text ==
                                                                    'video'))
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        10.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            640.0,
                                                                        maxHeight:
                                                                            350.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(18.0),
                                                                      ),
                                                                      child:
                                                                          FlutterFlowYoutubePlayer(
                                                                        url: lessonContentActivitiesRecord
                                                                            .video,
                                                                        autoPlay:
                                                                            false,
                                                                        looping:
                                                                            false,
                                                                        mute:
                                                                            false,
                                                                        showControls:
                                                                            true,
                                                                        showFullScreen:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 5.0))
                                                              .around(SizedBox(
                                                                  height: 5.0)),
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMedium,
                                                                    indicatorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    tabs: [
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'm3944me8' /* ملاحظات */,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          's41n6u6x' /* التدريبات */,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'frjynyr1' /* المرفقات */,
                                                                        ),
                                                                      ),
                                                                      Tab(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'a3s3qvh6' /* مناقشة */,
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
                                                                                Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
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
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4.0,
                                                                                              color: Color(0x230E151B),
                                                                                              offset: Offset(0.0, 2.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(18.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 10.0,
                                                                                                        height: 10.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'رقم الدرس: ${lessonContentActivitiesRecord.order.toString()}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Cairo',
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 10.0,
                                                                                                        height: 10.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'اسم الدرس : ${lessonContentActivitiesRecord.name}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Cairo',
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 10.0,
                                                                                                        height: 10.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'شرح : ${lessonContentActivitiesRecord.teacher}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Cairo',
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 10.0,
                                                                                                        height: 10.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'وصف : ${lessonContentActivitiesRecord.description}',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Cairo',
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Stack(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          StreamBuilder<List<ActivitiesProgressRecord>>(
                                                                                                            stream: queryActivitiesProgressRecord(
                                                                                                              queryBuilder: (activitiesProgressRecord) => activitiesProgressRecord
                                                                                                                  .where(
                                                                                                                    'activitID',
                                                                                                                    isEqualTo: lessonContentActivitiesRecord.reference,
                                                                                                                  )
                                                                                                                  .where(
                                                                                                                    'user',
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
                                                                                                              List<ActivitiesProgressRecord> iconActivitiesProgressRecordList = snapshot.data!;
                                                                                                              return InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  if (iconActivitiesProgressRecordList.length > 0) {
                                                                                                                    if (iconActivitiesProgressRecordList.first.isAttended) {
                                                                                                                      await iconActivitiesProgressRecordList.first.reference.update(createActivitiesProgressRecordData(
                                                                                                                        isAttended: false,
                                                                                                                      ));
                                                                                                                    } else {
                                                                                                                      await iconActivitiesProgressRecordList.first.reference.update(createActivitiesProgressRecordData(
                                                                                                                        isAttended: true,
                                                                                                                      ));
                                                                                                                    }
                                                                                                                  } else {
                                                                                                                    await ActivitiesProgressRecord.collection.doc().set(createActivitiesProgressRecordData(
                                                                                                                          activitID: lessonContentActivitiesRecord.reference,
                                                                                                                          user: currentUserReference,
                                                                                                                          when: getCurrentTimestamp,
                                                                                                                          isAttended: true,
                                                                                                                          supjID: lessonContentActivitiesRecord.supjRef,
                                                                                                                          type: 'lesson',
                                                                                                                        ));
                                                                                                                  }
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.done_all_outlined,
                                                                                                                  color: (iconActivitiesProgressRecordList.length > 0) && iconActivitiesProgressRecordList.first.isAttended ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
                                                                                                                  size: 40.0,
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                          StreamBuilder<List<ActivitiesProgressRecord>>(
                                                                                                            stream: queryActivitiesProgressRecord(
                                                                                                              queryBuilder: (activitiesProgressRecord) => activitiesProgressRecord
                                                                                                                  .where(
                                                                                                                    'activitID',
                                                                                                                    isEqualTo: lessonContentActivitiesRecord.reference,
                                                                                                                  )
                                                                                                                  .where(
                                                                                                                    'user',
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
                                                                                                              List<ActivitiesProgressRecord> iconActivitiesProgressRecordList = snapshot.data!;
                                                                                                              return InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onTap: () async {
                                                                                                                  if (iconActivitiesProgressRecordList.length > 0) {
                                                                                                                    if (iconActivitiesProgressRecordList.first.isSeen) {
                                                                                                                      await iconActivitiesProgressRecordList.first.reference.update(createActivitiesProgressRecordData(
                                                                                                                        isSeen: false,
                                                                                                                      ));
                                                                                                                    } else {
                                                                                                                      await iconActivitiesProgressRecordList.first.reference.update(createActivitiesProgressRecordData(
                                                                                                                        isSeen: true,
                                                                                                                      ));
                                                                                                                    }
                                                                                                                  } else {
                                                                                                                    await ActivitiesProgressRecord.collection.doc().set(createActivitiesProgressRecordData(
                                                                                                                          activitID: lessonContentActivitiesRecord.reference,
                                                                                                                          user: currentUserReference,
                                                                                                                          when: getCurrentTimestamp,
                                                                                                                          isSeen: true,
                                                                                                                          supjID: lessonContentActivitiesRecord.supjRef,
                                                                                                                          type: 'lesson',
                                                                                                                        ));
                                                                                                                  }
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.hearing,
                                                                                                                  color: (iconActivitiesProgressRecordList.length > 0) && iconActivitiesProgressRecordList.first.isSeen ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
                                                                                                                  size: 40.0,
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ].divide(SizedBox(height: 10.0)),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                                                  'order',
                                                                                  isEqualTo: lessonContentActivitiesRecord.order,
                                                                                )
                                                                                .where(
                                                                                  'visibility',
                                                                                  isEqualTo: true,
                                                                                )
                                                                                .where(
                                                                                  'supjRef',
                                                                                  isEqualTo: lessonContentActivitiesRecord.supjRef,
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
                                                                                testColomnActivitiesRecordList =
                                                                                snapshot.data!;
                                                                            if (testColomnActivitiesRecordList.isEmpty) {
                                                                              return Image.asset(
                                                                                'assets/images/5928294_3009287.jpg',
                                                                              );
                                                                            }
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(testColomnActivitiesRecordList.length, (testColomnIndex) {
                                                                                final testColomnActivitiesRecord = testColomnActivitiesRecordList[testColomnIndex];
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
                                                                                                testColomnActivitiesRecord.reference.id,
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
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                                child: StreamBuilder<List<QbankRecord>>(
                                                                                                  stream: queryQbankRecord(
                                                                                                    queryBuilder: (qbankRecord) => qbankRecord.where(
                                                                                                      'activid',
                                                                                                      isEqualTo: testColomnActivitiesRecord.reference,
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

                                                                                                          context.pushNamed(
                                                                                                            'testContent',
                                                                                                            queryParameters: {
                                                                                                              'testRef': serializeParam(
                                                                                                                testColomnActivitiesRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        } else {
                                                                                                          context.pushNamed(
                                                                                                            'testContent',
                                                                                                            queryParameters: {
                                                                                                              'testRef': serializeParam(
                                                                                                                testColomnActivitiesRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
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
                                                                                                            boxShadow: [
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
                                                                                                                alignment: AlignmentDirectional(-0.90, 0.85),
                                                                                                                child: Container(
                                                                                                                  width: 32.0,
                                                                                                                  height: 32.0,
                                                                                                                  decoration: BoxDecoration(
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
                                                                                                                  child: Align(
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
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(130.0, 0.0, 12.0, 0.0),
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
                                                                                                                              testColomnActivitiesRecord.name,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    fontSize: 16.0,
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
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
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                              child: Text(
                                                                                                                                'الوقت : ${testColomnActivitiesRecord.howLong.toString()}',
                                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      fontSize: 12.0,
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                              child: Text(
                                                                                                                                'المحاولات : ${testColomnActivitiesRecord.howMany.toString()}',
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
                                                                                                                                  color: testAttemptActivitiesProgressRowList.length > 1 ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).error,
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
                                                                                  'order',
                                                                                  isEqualTo: lessonContentActivitiesRecord.order,
                                                                                )
                                                                                .where(
                                                                                  'supjRef',
                                                                                  isEqualTo: lessonContentActivitiesRecord.supjRef,
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
                                                                                columnActivitiesRecordList =
                                                                                snapshot.data!;
                                                                            if (columnActivitiesRecordList.isEmpty) {
                                                                              return Image.asset(
                                                                                'assets/images/5928294_3009287.jpg',
                                                                              );
                                                                            }
                                                                            return SingleChildScrollView(
                                                                              primary: false,
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(columnActivitiesRecordList.length, (columnIndex) {
                                                                                  final columnActivitiesRecord = columnActivitiesRecordList[columnIndex];
                                                                                  return Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
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
                                                                                                boxShadow: [
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
                                                                                                      height: 100.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-0.90, 0.85),
                                                                                                    child: Container(
                                                                                                      width: 32.0,
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
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
                                                                                                      child: Icon(
                                                                                                        Icons.attach_file,
                                                                                                        color: Color(0xFF14181B),
                                                                                                        size: 20.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(130.0, 0.0, 12.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'yzvogjcb' /* 01 باب الطهارة */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 16.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'iew931d5' /* 45Min */,
                                                                                                            ),
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
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'cn3dbhev' /* الشيخ هشام فؤاد */,
                                                                                                                ),
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
                                                                                Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              8.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'croe4t9v' /* قريبا... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Cairo',
                                                                                  fontSize: 32.0,
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
              )),
        );
      },
    );
  }
}
