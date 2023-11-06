import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/qbank_answer/qbank_answer_widget.dart';
import '/components/qbank_answer_copy/qbank_answer_copy_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'test_content_model.dart';
export 'test_content_model.dart';

class TestContentWidget extends StatefulWidget {
  const TestContentWidget({
    super.key,
    required this.testRef,
  });

  final DocumentReference? testRef;

  @override
  _TestContentWidgetState createState() => _TestContentWidgetState();
}

class _TestContentWidgetState extends State<TestContentWidget> {
  late TestContentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestContentModel());

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

    return StreamBuilder<ActivitiesRecord>(
      stream: ActivitiesRecord.getDocument(widget.testRef!),
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
        final testContentActivitiesRecord = snapshot.data!;
        return Title(
            title: 'testContent',
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
                    child: const Nav0Widget(),
                  ),
                )),
                body: FutureBuilder<List<ActivitiesProgressRow>>(
                  future: ActivitiesProgressTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'type',
                          'test',
                        )
                        .eq(
                          'activitID',
                          testContentActivitiesRecord.reference.id,
                        )
                        .eq(
                          'userID',
                          currentUserReference?.id,
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
                    List<ActivitiesProgressRow>
                        containerActivitiesProgressRowList = snapshot.data!;
                    return Container(
                      decoration: const BoxDecoration(),
                      child: Container(
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 50.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: wrapWithModel(
                                            model: _model.topbarModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const TopbarWidget(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (containerActivitiesProgressRowList.isEmpty) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.88,
                                              constraints: const BoxConstraints(
                                                maxWidth: 700.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x320E151B),
                                                    offset: Offset(0.0, -2.0),
                                                  )
                                                ],
                                                borderRadius: const BorderRadius.only(
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  StreamBuilder<
                                                                      List<
                                                                          QbankRecord>>(
                                                                    stream:
                                                                        queryQbankRecord(
                                                                      queryBuilder: (qbankRecord) => qbankRecord
                                                                          .where(
                                                                            'activid',
                                                                            isEqualTo:
                                                                                widget.testRef,
                                                                          )
                                                                          .orderBy('time'),
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
                                                                      List<QbankRecord>
                                                                          containerQbankRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child: FutureBuilder<
                                                                            List<QbankAttemptsRow>>(
                                                                          future:
                                                                              QbankAttemptsTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eq(
                                                                                  'usersID',
                                                                                  currentUserReference?.id,
                                                                                )
                                                                                .eq(
                                                                                  'isTrue',
                                                                                  true,
                                                                                )
                                                                                .eq(
                                                                                  'QbankActivitID',
                                                                                  testContentActivitiesRecord.reference.id,
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
                                                                            List<QbankAttemptsRow>
                                                                                containerQbankAttemptsRowList =
                                                                                snapshot.data!;
                                                                            return InkWell(
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
                                                                                          title: const Text('إنهاء وتسليم'),
                                                                                          content: const Text('هل متأكد من إنهاء المحاولة'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: const Text('لا'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: const Text('نعم'),
                                                                                            ),
                                                                                          ],
                                                                                        ));
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (confirmDialogResponse) {
                                                                                  await ActivitiesProgressTable().insert({
                                                                                    'ID': '${getCurrentTimestamp.secondsSinceEpoch.toString()}${random_data.randomString(
                                                                                      10,
                                                                                      16,
                                                                                      true,
                                                                                      true,
                                                                                      true,
                                                                                    )}',
                                                                                    'activitID': widget.testRef?.id,
                                                                                    'grade': ((containerQbankAttemptsRowList.length.toDouble() / containerQbankRecordList.length.toDouble())) >= 1.0 ? 1.0 : ((containerQbankAttemptsRowList.length.toDouble() / containerQbankRecordList.length.toDouble())),
                                                                                    'isAttended': true,
                                                                                    'isDone': true,
                                                                                    'isSeen': true,
                                                                                    'supjID': testContentActivitiesRecord.supjRef?.id,
                                                                                    'type': 'test',
                                                                                    'userID': currentUserReference?.id,
                                                                                    'when': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                    'categID': '',
                                                                                  });
                                                                                  context.safePop();
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  borderRadius: BorderRadius.circular(14.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(-0.00, 0.00),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'xkpzpi1w' /* خروج وتسليم */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Cairo',
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<QbankRecord>>(
                                                                            stream:
                                                                                queryQbankRecord(
                                                                              queryBuilder: (qbankRecord) => qbankRecord.where(
                                                                                'activid',
                                                                                isEqualTo: widget.testRef,
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
                                                                              List<QbankRecord> textQbankRecordList = snapshot.data!;
                                                                              return Text(
                                                                                'عدد الأسئلة : ${textQbankRecordList.length.toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  25.0),
                                                      child: StreamBuilder<
                                                          List<QbankRecord>>(
                                                        stream:
                                                            queryQbankRecord(
                                                          queryBuilder:
                                                              (qbankRecord) =>
                                                                  qbankRecord
                                                                      .where(
                                                                        'activid',
                                                                        isEqualTo:
                                                                            widget.testRef,
                                                                      )
                                                                      .orderBy(
                                                                          'order'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<QbankRecord>
                                                              qbankQbankRecordList =
                                                              snapshot.data!;
                                                          return SingleChildScrollView(
                                                            primary: false,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: List.generate(
                                                                  qbankQbankRecordList
                                                                      .length,
                                                                  (qbankIndex) {
                                                                final qbankQbankRecord =
                                                                    qbankQbankRecordList[
                                                                        qbankIndex];
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              5.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(9.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: () {
                                                                                if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
                                                                                  return 350.0;
                                                                                } else if (MediaQuery.sizeOf(context).width <= kBreakpointMedium) {
                                                                                  return 500.0;
                                                                                } else {
                                                                                  return 700.0;
                                                                                }
                                                                              }(),
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(9.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: () {
                                                                                            if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
                                                                                              return 330.0;
                                                                                            } else if (MediaQuery.sizeOf(context).width <= kBreakpointMedium) {
                                                                                              return 470.0;
                                                                                            } else {
                                                                                              return 670.0;
                                                                                            }
                                                                                          }(),
                                                                                        ),
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                          child: Text(
                                                                                            '${qbankQbankRecord.order.toString()}- ${qbankQbankRecord.qtext}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: () {
                                                                                            if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
                                                                                              return 350.0;
                                                                                            } else if (MediaQuery.sizeOf(context).width <= kBreakpointMedium) {
                                                                                              return 500.0;
                                                                                            } else {
                                                                                              return 700.0;
                                                                                            }
                                                                                          }(),
                                                                                        ),
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: wrapWithModel(
                                                                                          model: _model.qbankAnswerModels.getModel(
                                                                                            qbankQbankRecord.reference.id,
                                                                                            qbankIndex,
                                                                                          ),
                                                                                          updateCallback: () => setState(() {}),
                                                                                          child: QbankAnswerWidget(
                                                                                            key: Key(
                                                                                              'Key16u_${qbankQbankRecord.reference.id}',
                                                                                            ),
                                                                                            parameter1: qbankQbankRecord.options,
                                                                                            qBankRef: qbankQbankRecord.reference,
                                                                                            answer: qbankQbankRecord.answer,
                                                                                            activiRef: testContentActivitiesRecord.reference,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(const SizedBox(width: 5.0)).around(const SizedBox(width: 5.0)),
                                                                            ),
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
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(height: 5.0))
                                                    .around(
                                                        const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.00, 1.00),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.88,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 700.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
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
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
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
                                                                            context.safePop();
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              borderRadius: BorderRadius.circular(14.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(-0.00, 0.00),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'xqhpjcuq' /* عودة */,
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
                                                                        if (!testContentActivitiesRecord
                                                                            .isFinal)
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
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                          child: AlertDialog(
                                                                                        title: const Text('حذف وإعادة'),
                                                                                        content: const Text('هل أنت متأكد من رغبتك في حذف الدرجة السابقة وإعادة الاختبار؟'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: const Text('لا'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: const Text('نعم'),
                                                                                          ),
                                                                                        ],
                                                                                      ));
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (confirmDialogResponse) {
                                                                                await ActivitiesProgressTable().delete(
                                                                                  matchingRows: (rows) => rows.eq(
                                                                                    'ID',
                                                                                    containerActivitiesProgressRowList.first.id,
                                                                                  ),
                                                                                );

                                                                                context.pushNamed(
                                                                                  'testContent',
                                                                                  queryParameters: {
                                                                                    'testRef': serializeParam(
                                                                                      widget.testRef,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                borderRadius: BorderRadius.circular(14.0),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(-0.00, 0.00),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'arj0o93c' /* إعادة الاختبار */,
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
                                                                      ].divide(const SizedBox(
                                                                              height: 5.0)),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              StreamBuilder<List<QbankRecord>>(
                                                                                stream: queryQbankRecord(
                                                                                  queryBuilder: (qbankRecord) => qbankRecord.where(
                                                                                    'activid',
                                                                                    isEqualTo: widget.testRef,
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
                                                                                  List<QbankRecord> containerQbankRecordList = snapshot.data!;
                                                                                  return Container(
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: CircularPercentIndicator(
                                                                                      percent: containerActivitiesProgressRowList.first.grade!,
                                                                                      radius: 37.5,
                                                                                      lineWidth: 12.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).accent4,
                                                                                      center: Text(
                                                                                        '${(containerActivitiesProgressRowList.first.grade! * 100).toString()}%',
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: 'Cairo',
                                                                                              fontSize: 18.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            StreamBuilder<List<QbankRecord>>(
                                                                              stream: queryQbankRecord(
                                                                                queryBuilder: (qbankRecord) => qbankRecord.where(
                                                                                  'activid',
                                                                                  isEqualTo: widget.testRef,
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
                                                                                List<QbankRecord> textQbankRecordList = snapshot.data!;
                                                                                return Text(
                                                                                  'عدد الأسئلة : ${textQbankRecordList.length.toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                );
                                                                              },
                                                                            ),
                                                                            FutureBuilder<List<QbankAttemptsRow>>(
                                                                              future: QbankAttemptsTable().queryRows(
                                                                                queryFn: (q) => q
                                                                                    .eq(
                                                                                      'isTrue',
                                                                                      true,
                                                                                    )
                                                                                    .eq(
                                                                                      'usersID',
                                                                                      currentUserReference?.id,
                                                                                    )
                                                                                    .eq(
                                                                                      'QbankActivitID',
                                                                                      testContentActivitiesRecord.reference.id,
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
                                                                                List<QbankAttemptsRow> textQbankAttemptsRowList = snapshot.data!;
                                                                                return Text(
                                                                                  'صواب : ${textQbankAttemptsRowList.length.toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      width:
                                                                          5.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    25.0),
                                                        child: StreamBuilder<
                                                            List<QbankRecord>>(
                                                          stream:
                                                              queryQbankRecord(
                                                            queryBuilder:
                                                                (qbankRecord) =>
                                                                    qbankRecord
                                                                        .where(
                                                                          'activid',
                                                                          isEqualTo:
                                                                              widget.testRef,
                                                                        )
                                                                        .orderBy(
                                                                            'order'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<QbankRecord>
                                                                qbankQbankRecordList =
                                                                snapshot.data!;
                                                            return SingleChildScrollView(
                                                              primary: false,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    qbankQbankRecordList
                                                                        .length,
                                                                    (qbankIndex) {
                                                                  final qbankQbankRecord =
                                                                      qbankQbankRecordList[
                                                                          qbankIndex];
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              5.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(9.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: () {
                                                                                if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
                                                                                  return 350.0;
                                                                                } else if (MediaQuery.sizeOf(context).width <= kBreakpointMedium) {
                                                                                  return 500.0;
                                                                                } else {
                                                                                  return 700.0;
                                                                                }
                                                                              }(),
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(9.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FutureBuilder<List<QbankAttemptsRow>>(
                                                                                          future: QbankAttemptsTable().queryRows(
                                                                                            queryFn: (q) => q
                                                                                                .eq(
                                                                                                  'usersID',
                                                                                                  currentUserReference?.id,
                                                                                                )
                                                                                                .eq(
                                                                                                  'QbankID',
                                                                                                  qbankQbankRecord.reference.id,
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
                                                                                            List<QbankAttemptsRow> containerQbankAttemptsRowList = snapshot.data!;
                                                                                            return Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Icon(
                                                                                                Icons.radio_button_checked_rounded,
                                                                                                color: valueOrDefault<Color>(
                                                                                                  () {
                                                                                                    if (containerQbankAttemptsRowList.isEmpty) {
                                                                                                      return FlutterFlowTheme.of(context).accent4;
                                                                                                    } else if ((qbankQbankRecord.answer == containerQbankAttemptsRowList.first.qbankAnswer) && (containerQbankAttemptsRowList.isNotEmpty)) {
                                                                                                      return FlutterFlowTheme.of(context).secondary;
                                                                                                    } else {
                                                                                                      return FlutterFlowTheme.of(context).alternate;
                                                                                                    }
                                                                                                  }(),
                                                                                                  FlutterFlowTheme.of(context).accent2,
                                                                                                ),
                                                                                                size: 24.0,
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                          child: Container(
                                                                                            constraints: BoxConstraints(
                                                                                              maxWidth: () {
                                                                                                if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
                                                                                                  return 330.0;
                                                                                                } else if (MediaQuery.sizeOf(context).width <= kBreakpointMedium) {
                                                                                                  return 470.0;
                                                                                                } else {
                                                                                                  return 670.0;
                                                                                                }
                                                                                              }(),
                                                                                            ),
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                              child: Text(
                                                                                                '${qbankQbankRecord.order.toString()}- ${qbankQbankRecord.qtext}',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: () {
                                                                                            if (MediaQuery.sizeOf(context).width <= kBreakpointSmall) {
                                                                                              return 350.0;
                                                                                            } else if (MediaQuery.sizeOf(context).width <= kBreakpointMedium) {
                                                                                              return 500.0;
                                                                                            } else {
                                                                                              return 700.0;
                                                                                            }
                                                                                          }(),
                                                                                        ),
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: wrapWithModel(
                                                                                          model: _model.qbankAnswerCopyModels.getModel(
                                                                                            qbankQbankRecord.reference.id,
                                                                                            qbankIndex,
                                                                                          ),
                                                                                          updateCallback: () => setState(() {}),
                                                                                          child: QbankAnswerCopyWidget(
                                                                                            key: Key(
                                                                                              'Keyw0x_${qbankQbankRecord.reference.id}',
                                                                                            ),
                                                                                            answer: qbankQbankRecord.answer,
                                                                                            parameter1: qbankQbankRecord.options,
                                                                                            qBankRef: qbankQbankRecord.reference,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FutureBuilder<List<QbankAttemptsRow>>(
                                                                                          future: QbankAttemptsTable().queryRows(
                                                                                            queryFn: (q) => q
                                                                                                .eq(
                                                                                                  'usersID',
                                                                                                  currentUserReference?.id,
                                                                                                )
                                                                                                .eq(
                                                                                                  'QbankID',
                                                                                                  qbankQbankRecord.reference.id,
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
                                                                                            List<QbankAttemptsRow> containerQbankAttemptsRowList = snapshot.data!;
                                                                                            return Container(
                                                                                              decoration: const BoxDecoration(),
                                                                                              child: Container(
                                                                                                width: 300.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                  child: Text(
                                                                                                    'الإجابة الصحيحة : ${qbankQbankRecord.answer}',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(const SizedBox(width: 5.0)).around(const SizedBox(width: 5.0)),
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
                                                    ),
                                                  ]
                                                      .divide(
                                                          const SizedBox(height: 5.0))
                                                      .around(const SizedBox(
                                                          height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
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
            ));
      },
    );
  }
}
