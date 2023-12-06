import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/lesson_decrip/lesson_decrip_widget.dart';
import '/components/lesson_name/lesson_name_widget.dart';
import '/components/lesson_order/lesson_order_widget.dart';
import '/components/lesson_time/lesson_time_widget.dart';
import '/components/lesson_youtube/lesson_youtube_widget.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'admin_supj_model.dart';
export 'admin_supj_model.dart';

class AdminSupjWidget extends StatefulWidget {
  const AdminSupjWidget({
    super.key,
    this.output,
    required this.supjRef,
  });

  final bool? output;
  final DocumentReference? supjRef;

  @override
  _AdminSupjWidgetState createState() => _AdminSupjWidgetState();
}

class _AdminSupjWidgetState extends State<AdminSupjWidget>
    with TickerProviderStateMixin {
  late AdminSupjModel _model;

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
    _model = createModel(context, () => AdminSupjModel());

    _model.supjNameFocusNode ??= FocusNode();

    _model.supjTeatcherFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.docNameController ??= TextEditingController();
    _model.docNameFocusNode ??= FocusNode();

    _model.docTypeController ??= TextEditingController();
    _model.docTypeFocusNode ??= FocusNode();

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
      stream: SupjRecord.getDocument(widget.supjRef!),
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
        final adminSupjSupjRecord = snapshot.data!;
        return Title(
            title: 'adminSupj',
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
                                                              context.pushNamed(
                                                                  'admincourses');
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
                                                                      'l6f4ktny' /* المقررات */,
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
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (!adminSupjSupjRecord
                                                                  .visibility)
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    await widget
                                                                        .supjRef!
                                                                        .update(
                                                                            createSupjRecordData(
                                                                      visibility:
                                                                          true,
                                                                    ));
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .eyeSlash,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                ),
                                                              if (adminSupjSupjRecord
                                                                  .visibility)
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    await widget
                                                                        .supjRef!
                                                                        .update(
                                                                            createSupjRecordData(
                                                                      visibility:
                                                                          false,
                                                                    ));
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 30.0,
                                                                  ),
                                                                ),
                                                            ],
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
                                                            MainAxisSize.max,
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
                                                              Container(
                                                                width: 200.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model.supjNameController ??=
                                                                            TextEditingController(
                                                                      text: adminSupjSupjRecord
                                                                          .name,
                                                                    ),
                                                                    focusNode:
                                                                        _model
                                                                            .supjNameFocusNode,
                                                                    autofocus:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'iegu9365' /* Label here... */,
                                                                      ),
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMedium,
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMedium,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    validator: _model
                                                                        .supjNameControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 200.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model.supjTeatcherController ??=
                                                                            TextEditingController(
                                                                      text: adminSupjSupjRecord
                                                                          .teacherString,
                                                                    ),
                                                                    focusNode:
                                                                        _model
                                                                            .supjTeatcherFocusNode,
                                                                    autofocus:
                                                                        true,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'd0qt9zff' /* Label here... */,
                                                                      ),
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMedium,
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMedium,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    validator: _model
                                                                        .supjTeatcherControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await widget
                                                                      .supjRef!
                                                                      .update(
                                                                          createSupjRecordData(
                                                                    name: _model
                                                                        .supjNameController
                                                                        .text,
                                                                    teacherString:
                                                                        _model
                                                                            .supjTeatcherController
                                                                            .text,
                                                                  ));
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'تم تحديث اسم المادة والمعلم',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'gn69rz11' /* حفظ */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ]
                                                                .divide(const SizedBox(
                                                                    height:
                                                                        5.0))
                                                                .around(const SizedBox(
                                                                    height:
                                                                        5.0)),
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
                                                                      'xixkpqf5' /* الدروس */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '72rbs0tm' /* التدريبات */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1dy15lj7' /* المرفقات */,
                                                                    ),
                                                                  ),
                                                                  Tab(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'htv1tvo7' /* نظرة عامة */,
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
                                                                            SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await ActivitiesRecord.collection.doc().set(createActivitiesRecordData(
                                                                                        supjRef: widget.supjRef,
                                                                                        type: 'lesson',
                                                                                        teacher: adminSupjSupjRecord.teacherString,
                                                                                        startTime: getCurrentTimestamp,
                                                                                      ));
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'umdwqedv' /* إضافة درس */,
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
                                                                          StreamBuilder<
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
                                                                                    isEqualTo: widget.supjRef,
                                                                                  )
                                                                                  .orderBy('startTime'),
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
                                                                              List<ActivitiesRecord> lesonColumnActivitiesRecordList = snapshot.data!;
                                                                              if (lesonColumnActivitiesRecordList.isEmpty) {
                                                                                return Image.asset(
                                                                                  'assets/images/5928294_3009287.jpg',
                                                                                );
                                                                              }
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
                                                                                                  'lessonContentCopy1',
                                                                                                  queryParameters: {
                                                                                                    'activiRef': serializeParam(
                                                                                                      lesonColumnActivitiesRecord.reference,
                                                                                                      ParamType.DocumentReference,
                                                                                                    ),
                                                                                                    'categRef': serializeParam(
                                                                                                      adminSupjSupjRecord.supCateg,
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
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        decoration: const BoxDecoration(),
                                                                                                                        child: wrapWithModel(
                                                                                                                          model: _model.lessonOrderModels.getModel(
                                                                                                                            lesonColumnActivitiesRecord.startTime!.toString(),
                                                                                                                            lesonColumnIndex,
                                                                                                                          ),
                                                                                                                          updateCallback: () => setState(() {}),
                                                                                                                          child: LessonOrderWidget(
                                                                                                                            key: Key(
                                                                                                                              'Keykg8_${lesonColumnActivitiesRecord.startTime!.toString()}',
                                                                                                                            ),
                                                                                                                            activiRef: lesonColumnActivitiesRecord.reference,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: LessonNameWidget(
                                                                                                                        key: Key('Key5rz_${lesonColumnIndex}_of_${lesonColumnActivitiesRecordList.length}'),
                                                                                                                        activiRef: lesonColumnActivitiesRecord.reference,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: LessonYoutubeWidget(
                                                                                                                        key: Key('Keygso_${lesonColumnIndex}_of_${lesonColumnActivitiesRecordList.length}'),
                                                                                                                        activiRef: lesonColumnActivitiesRecord.reference,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: LessonTimeWidget(
                                                                                                                        key: Key('Keyvpl_${lesonColumnIndex}_of_${lesonColumnActivitiesRecordList.length}'),
                                                                                                                        activiRef: lesonColumnActivitiesRecord.reference,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: LessonDecripWidget(
                                                                                                                        key: Key('Key8uz_${lesonColumnIndex}_of_${lesonColumnActivitiesRecordList.length}'),
                                                                                                                        activiRef: lesonColumnActivitiesRecord.reference,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: const BoxDecoration(),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                InkWell(
                                                                                                                  splashColor: Colors.transparent,
                                                                                                                  focusColor: Colors.transparent,
                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                  onTap: () async {
                                                                                                                    await lesonColumnActivitiesRecord.reference.delete();
                                                                                                                  },
                                                                                                                  child: Icon(
                                                                                                                    Icons.delete_forever_rounded,
                                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                                    size: 40.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                FFButtonWidget(
                                                                                                                  onPressed: () async {
                                                                                                                    final selectedFiles = await selectFiles(
                                                                                                                      allowedExtensions: ['mp3'],
                                                                                                                      multiFile: false,
                                                                                                                    );
                                                                                                                    if (selectedFiles != null) {
                                                                                                                      setState(() => _model.isDataUploading1 = true);
                                                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                                      var downloadUrls = <String>[];
                                                                                                                      try {
                                                                                                                        showUploadMessage(
                                                                                                                          context,
                                                                                                                          'Uploading file...',
                                                                                                                          showLoading: true,
                                                                                                                        );
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
                                                                                                                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                                        _model.isDataUploading1 = false;
                                                                                                                      }
                                                                                                                      if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                                        setState(() {
                                                                                                                          _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                                                          _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                                                        });
                                                                                                                        showUploadMessage(
                                                                                                                          context,
                                                                                                                          'Success!',
                                                                                                                        );
                                                                                                                      } else {
                                                                                                                        setState(() {});
                                                                                                                        showUploadMessage(
                                                                                                                          context,
                                                                                                                          'Failed to upload file',
                                                                                                                        );
                                                                                                                        return;
                                                                                                                      }
                                                                                                                    }

                                                                                                                    await lesonColumnActivitiesRecord.reference.update(createActivitiesRecordData(
                                                                                                                      audio: _model.uploadedFileUrl1,
                                                                                                                    ));
                                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                      SnackBar(
                                                                                                                        content: Text(
                                                                                                                          'uploaded',
                                                                                                                          style: TextStyle(
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        duration: const Duration(milliseconds: 4000),
                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                  text: '',
                                                                                                                  icon: Icon(
                                                                                                                    Icons.graphic_eq,
                                                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                    size: 15.0,
                                                                                                                  ),
                                                                                                                  options: FFButtonOptions(
                                                                                                                    width: 40.0,
                                                                                                                    height: 40.0,
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
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
                                                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(const SizedBox(height: 10.0)),
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
                                                                        ].divide(const SizedBox(height: 5.0)).around(const SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  KeepAliveWidgetWrapper(
                                                                    builder:
                                                                        (context) =>
                                                                            SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await ActivitiesRecord.collection.doc().set(createActivitiesRecordData(
                                                                                        type: 'test',
                                                                                        gradable: true,
                                                                                        supjRef: widget.supjRef,
                                                                                        isFinal: false,
                                                                                        available: false,
                                                                                        visibility: false,
                                                                                        startTime: getCurrentTimestamp,
                                                                                      ));
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'fvdvt0vt' /* إضافة تدريب */,
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
                                                                          StreamBuilder<
                                                                              List<ActivitiesRecord>>(
                                                                            stream:
                                                                                FFAppState().test(
                                                                              requestFn: () => queryActivitiesRecord(
                                                                                queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                    .where(
                                                                                      'type',
                                                                                      isEqualTo: 'test',
                                                                                    )
                                                                                    .where(
                                                                                      'supjRef',
                                                                                      isEqualTo: widget.supjRef,
                                                                                    ),
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
                                                                              List<ActivitiesRecord> testColumnActivitiesRecordList = snapshot.data!;
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
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
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
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                    child: Column(
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
                                                                                                                              List<QbankRecord> textQbankRecordList = snapshot.data!;
                                                                                                                              return Text(
                                                                                                                                'عدد الأسئلة : ${textQbankRecordList.length.toString()}',
                                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                      fontFamily: 'Readex Pro',
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                      fontSize: 12.0,
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                    ),
                                                                                                                              );
                                                                                                                            },
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
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Stack(
                                                                                                                      children: [
                                                                                                                        Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            if (testColumnActivitiesRecord.visibility)
                                                                                                                              InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await testColumnActivitiesRecord.reference.update(createActivitiesRecordData(
                                                                                                                                    visibility: false,
                                                                                                                                  ));
                                                                                                                                },
                                                                                                                                child: FaIcon(
                                                                                                                                  FontAwesomeIcons.solidEye,
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  size: 40.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            if (!testColumnActivitiesRecord.visibility)
                                                                                                                              InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await testColumnActivitiesRecord.reference.update(createActivitiesRecordData(
                                                                                                                                    visibility: true,
                                                                                                                                  ));
                                                                                                                                },
                                                                                                                                child: FaIcon(
                                                                                                                                  FontAwesomeIcons.solidEyeSlash,
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
                                                                                                                                context.pushNamed(
                                                                                                                                  'adminSupjTest',
                                                                                                                                  queryParameters: {
                                                                                                                                    'output': serializeParam(
                                                                                                                                      false,
                                                                                                                                      ParamType.bool,
                                                                                                                                    ),
                                                                                                                                    'activRef': serializeParam(
                                                                                                                                      testColumnActivitiesRecord.reference,
                                                                                                                                      ParamType.DocumentReference,
                                                                                                                                    ),
                                                                                                                                  }.withoutNulls,
                                                                                                                                );
                                                                                                                              },
                                                                                                                              child: Icon(
                                                                                                                                Icons.edit_outlined,
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
                                                                                                                                await testColumnActivitiesRecord.reference.delete();
                                                                                                                              },
                                                                                                                              child: Icon(
                                                                                                                                Icons.delete_forever,
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                size: 40.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ].divide(const SizedBox(height: 5.0)).around(const SizedBox(height: 5.0)),
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
                                                                                              ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
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
                                                                        ].divide(const SizedBox(height: 5.0)).around(const SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  KeepAliveWidgetWrapper(
                                                                    builder:
                                                                        (context) =>
                                                                            SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.white,
                                                                                      boxShadow: const [
                                                                                        BoxShadow(
                                                                                          blurRadius: 5.0,
                                                                                          color: Color(0x162D3A21),
                                                                                          offset: Offset(0.0, 3.0),
                                                                                        )
                                                                                      ],
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.docNameController,
                                                                                                    focusNode: _model.docNameFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.docNameController',
                                                                                                      const Duration(milliseconds: 2000),
                                                                                                      () => setState(() {}),
                                                                                                    ),
                                                                                                    autofocus: true,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                                        'fxvujbck' /* اسم الملف */,
                                                                                                      ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        '0mkl5u13' /* اسم الملف */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                                            color: const Color(0xFF57636C),
                                                                                                            fontSize: 12.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          topLeft: Radius.circular(4.0),
                                                                                                          topRight: Radius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          topLeft: Radius.circular(4.0),
                                                                                                          topRight: Radius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          topLeft: Radius.circular(4.0),
                                                                                                          topRight: Radius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          topLeft: Radius.circular(4.0),
                                                                                                          topRight: Radius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      contentPadding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 8.0, 12.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          color: const Color(0xFF14181B),
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                    maxLines: 8,
                                                                                                    minLines: 3,
                                                                                                    validator: _model.docNameControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.docTypeController,
                                                                                                    focusNode: _model.docTypeFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.docTypeController',
                                                                                                      const Duration(milliseconds: 2000),
                                                                                                      () => setState(() {}),
                                                                                                    ),
                                                                                                    autofocus: true,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                                        'hrsc1yrh' /* نوع الملف */,
                                                                                                      ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'jwxb6u82' /* نوع الملف */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            fontFamily: 'Plus Jakarta Sans',
                                                                                                            color: const Color(0xFF57636C),
                                                                                                            fontSize: 12.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          topLeft: Radius.circular(4.0),
                                                                                                          topRight: Radius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          topLeft: Radius.circular(4.0),
                                                                                                          topRight: Radius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          topLeft: Radius.circular(4.0),
                                                                                                          topRight: Radius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: const BorderRadius.only(
                                                                                                          topLeft: Radius.circular(4.0),
                                                                                                          topRight: Radius.circular(4.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      contentPadding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 8.0, 12.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                                          color: const Color(0xFF14181B),
                                                                                                          fontSize: 14.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                    maxLines: 8,
                                                                                                    minLines: 3,
                                                                                                    validator: _model.docTypeControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        const Divider(
                                                                                          height: 12.0,
                                                                                          thickness: 2.0,
                                                                                          color: Color(0xFFE0E3E7),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 12.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                    child: FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 30.0,
                                                                                                      borderWidth: 1.0,
                                                                                                      buttonSize: 40.0,
                                                                                                      icon: const Icon(
                                                                                                        Icons.edit_document,
                                                                                                        color: Color(0xFF57636C),
                                                                                                        size: 20.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        final selectedFiles = await selectFiles(
                                                                                                          allowedExtensions: ['pdf'],
                                                                                                          multiFile: false,
                                                                                                        );
                                                                                                        if (selectedFiles != null) {
                                                                                                          setState(() => _model.isDataUploading2 = true);
                                                                                                          var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                          var downloadUrls = <String>[];
                                                                                                          try {
                                                                                                            showUploadMessage(
                                                                                                              context,
                                                                                                              'Uploading file...',
                                                                                                              showLoading: true,
                                                                                                            );
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
                                                                                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                            _model.isDataUploading2 = false;
                                                                                                          }
                                                                                                          if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                            setState(() {
                                                                                                              _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                                              _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                                            });
                                                                                                            showUploadMessage(
                                                                                                              context,
                                                                                                              'Success!',
                                                                                                            );
                                                                                                          } else {
                                                                                                            setState(() {});
                                                                                                            showUploadMessage(
                                                                                                              context,
                                                                                                              'Failed to upload file',
                                                                                                            );
                                                                                                            return;
                                                                                                          }
                                                                                                        }
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  await ActivitiesRecord.collection.doc().set(createActivitiesRecordData(
                                                                                                        name: _model.docNameController.text,
                                                                                                        type: 'docs',
                                                                                                        supjRef: widget.supjRef,
                                                                                                        teacher: adminSupjSupjRecord.teacherString,
                                                                                                        startTime: getCurrentTimestamp,
                                                                                                        doc: _model.uploadedFileUrl2,
                                                                                                      ));
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        'تم إضافة مرفق  بنجاح',
                                                                                                        style: TextStyle(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        ),
                                                                                                      ),
                                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                    ),
                                                                                                  );
                                                                                                  setState(() {
                                                                                                    _model.docNameController?.clear();
                                                                                                    _model.docTypeController?.clear();
                                                                                                  });
                                                                                                },
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  '6jawh0sk' /* إضافة */,
                                                                                                ),
                                                                                                options: FFButtonOptions(
                                                                                                  width: 90.0,
                                                                                                  height: 40.0,
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                        color: Colors.white,
                                                                                                        fontSize: 16.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                  elevation: 2.0,
                                                                                                  borderSide: const BorderSide(
                                                                                                    color: Colors.transparent,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<ActivitiesRecord>>(
                                                                            stream:
                                                                                FFAppState().docs(
                                                                              requestFn: () => queryActivitiesRecord(
                                                                                queryBuilder: (activitiesRecord) => activitiesRecord.where(
                                                                                  'type',
                                                                                  isEqualTo: 'docs',
                                                                                ),
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
                                                                              List<ActivitiesRecord> docsColumnActivitiesRecordList = snapshot.data!;
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
                                                                                                                    InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        await docsColumnActivitiesRecord.reference.delete();
                                                                                                                      },
                                                                                                                      child: Icon(
                                                                                                                        Icons.delete_forever_rounded,
                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                                        size: 40.0,
                                                                                                                      ),
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
                                                                        ].divide(const SizedBox(height: 5.0)).around(const SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  KeepAliveWidgetWrapper(
                                                                    builder:
                                                                        (context) =>
                                                                            Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  FutureBuilder<int>(
                                                                                    future: queryActivitiesRecordCount(
                                                                                      queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                          .where(
                                                                                            'supjRef',
                                                                                            isEqualTo: widget.supjRef,
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
                                                                                      int textCount = snapshot.data!;
                                                                                      return Text(
                                                                                        'عدد دروس هذا المقرر = ${textCount.toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Cairo',
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                  FutureBuilder<int>(
                                                                                    future: queryActivitiesProgressRecordCount(
                                                                                      queryBuilder: (activitiesProgressRecord) => activitiesProgressRecord
                                                                                          .where(
                                                                                            'supjID',
                                                                                            isEqualTo: widget.supjRef,
                                                                                          )
                                                                                          .where(
                                                                                            'type',
                                                                                            isEqualTo: 'lesson',
                                                                                          )
                                                                                          .where(
                                                                                            'isAttended',
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
                                                                                      int textCount = snapshot.data!;
                                                                                      return Text(
                                                                                        'حضرت منهم ${textCount.toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Cairo',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                  FutureBuilder<int>(
                                                                                    future: queryActivitiesProgressRecordCount(
                                                                                      queryBuilder: (activitiesProgressRecord) => activitiesProgressRecord
                                                                                          .where(
                                                                                            'supjID',
                                                                                            isEqualTo: widget.supjRef,
                                                                                          )
                                                                                          .where(
                                                                                            'type',
                                                                                            isEqualTo: 'lesson',
                                                                                          )
                                                                                          .where(
                                                                                            'isSeen',
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
                                                                                      int textCount = snapshot.data!;
                                                                                      return Text(
                                                                                        'سمعت  منهم ${textCount.toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Cairo',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  FutureBuilder<int>(
                                                                                    future: queryActivitiesRecordCount(
                                                                                      queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                          .where(
                                                                                            'supjRef',
                                                                                            isEqualTo: widget.supjRef,
                                                                                          )
                                                                                          .where(
                                                                                            'type',
                                                                                            isEqualTo: 'test',
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
                                                                                      int textCount = snapshot.data!;
                                                                                      return Text(
                                                                                        'عدد التدريبات هذا المقرر = ${textCount.toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Cairo',
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                  FutureBuilder<int>(
                                                                                    future: queryActivitiesRecordCount(
                                                                                      queryBuilder: (activitiesRecord) => activitiesRecord
                                                                                          .where(
                                                                                            'supjRef',
                                                                                            isEqualTo: widget.supjRef,
                                                                                          )
                                                                                          .where(
                                                                                            'type',
                                                                                            isEqualTo: 'test',
                                                                                          )
                                                                                          .where(
                                                                                            'isDone',
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
                                                                                      int textCount = snapshot.data!;
                                                                                      return Text(
                                                                                        'أنهيت منهم ${textCount.toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Cairo',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(const SizedBox(height: 5.0)),
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
