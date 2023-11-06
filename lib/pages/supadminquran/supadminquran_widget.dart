import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/profilecomp/profilecomp_widget.dart';
import '/components/quran_create/quran_create_widget.dart';
import '/components/quranupdate/quranupdate_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'supadminquran_model.dart';
export 'supadminquran_model.dart';

class SupadminquranWidget extends StatefulWidget {
  const SupadminquranWidget({super.key});

  @override
  _SupadminquranWidgetState createState() => _SupadminquranWidgetState();
}

class _SupadminquranWidgetState extends State<SupadminquranWidget>
    with TickerProviderStateMixin {
  late SupadminquranModel _model;

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
          begin: const Offset(0.0, 100.0),
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
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupadminquranModel());

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

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.mentoorController ??= TextEditingController(
        text: '$currentUserEmail/${_model.textController1.text}');
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

    return StreamBuilder<List<CategRecord>>(
      stream: queryCategRecord(),
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
        List<CategRecord> supadminquranCategRecordList = snapshot.data!;
        return Title(
            title: 'supadminquran',
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
                                            decoration: const BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child:
                                                                            Container(
                                                                          constraints:
                                                                              const BoxConstraints(
                                                                            maxWidth:
                                                                                700.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: const [
                                                                              BoxShadow(
                                                                                blurRadius: 0.0,
                                                                                color: Color(0xFFE0E3E7),
                                                                                offset: Offset(0.0, 1.0),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(23.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                    child: Wrap(
                                                                                      spacing: 0.0,
                                                                                      runSpacing: 0.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 150.0,
                                                                                              decoration: const BoxDecoration(),
                                                                                              child: FlutterFlowDropDown<String>(
                                                                                                controller: _model.dropDownValueController ??= FormFieldController<String>(null),
                                                                                                options: supadminquranCategRecordList.map((e) => e.name).toList(),
                                                                                                onChanged: (val) async {
                                                                                                  setState(() => _model.dropDownValue = val);
                                                                                                  setState(() {
                                                                                                    _model.categRef = supadminquranCategRecordList.where((e) => e.name == _model.dropDownValue).toList().first.reference;
                                                                                                  });
                                                                                                },
                                                                                                width: 300.0,
                                                                                                height: 50.0,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'zifkvlse' /* الفصل الدراسي */,
                                                                                                ),
                                                                                                icon: Icon(
                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                elevation: 2.0,
                                                                                                borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                                borderWidth: 2.0,
                                                                                                borderRadius: 8.0,
                                                                                                margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                                hidesUnderline: true,
                                                                                                isSearchable: false,
                                                                                                isMultiSelect: false,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 150.0,
                                                                                              decoration: const BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                child: TextFormField(
                                                                                                  controller: _model.textController1,
                                                                                                  focusNode: _model.textFieldFocusNode,
                                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                                    '_model.textController1',
                                                                                                    const Duration(milliseconds: 1000),
                                                                                                    () => setState(() {}),
                                                                                                  ),
                                                                                                  autofocus: true,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                                      'qtzbqjcx' /* الكلمة المفتاحية */,
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
                                                                                                    prefixIcon: const Icon(
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
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                              desktop: false,
                                                                                            ))
                                                                                              Container(
                                                                                                width: 200.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.mentoorController,
                                                                                                    focusNode: _model.mentoorFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.mentoorController',
                                                                                                      const Duration(milliseconds: 1500),
                                                                                                      () => setState(() {}),
                                                                                                    ),
                                                                                                    autofocus: true,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelText: FFLocalizations.of(context).getText(
                                                                                                        '3hnjok87' /* Label here... */,
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
                                                                            ],
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final categs =
                                                                        supadminquranCategRecordList
                                                                            .toList();
                                                                    return SingleChildScrollView(
                                                                      primary:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            categs.length,
                                                                            (categsIndex) {
                                                                          final categsItem =
                                                                              categs[categsIndex];
                                                                          return Visibility(
                                                                            visible:
                                                                                _model.categRef == categsItem.reference,
                                                                            child:
                                                                                FutureBuilder<List<UsersRecord>>(
                                                                              future: UsersRecord.search(
                                                                                term: '$currentUserEmail/${_model.textController1.text}',
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
                                                                                List<UsersRecord> listViewUsersRecordList = snapshot.data!;
                                                                                // Customize what your widget looks like with no search results.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return const SizedBox(
                                                                                    height: 100,
                                                                                    child: Center(
                                                                                      child: Text('No results.'),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: listViewUsersRecordList.length,
                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                    final listViewUsersRecord = listViewUsersRecordList[listViewIndex];
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        if (listViewUsersRecord.isReal)
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: 70.0,
                                                                                              constraints: const BoxConstraints(
                                                                                                maxWidth: 700.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                boxShadow: const [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 0.0,
                                                                                                    color: Color(0xFFE0E3E7),
                                                                                                    offset: Offset(0.0, 1.0),
                                                                                                  )
                                                                                                ],
                                                                                                borderRadius: BorderRadius.circular(23.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          listViewIndex.toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 44.0,
                                                                                                          height: 44.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: const Color(0x4C4B39EF),
                                                                                                            shape: BoxShape.circle,
                                                                                                            border: Border.all(
                                                                                                              color: const Color(0xFF4B39EF),
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
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
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
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
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
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
                                                                                                      ].divide(const SizedBox(width: 5.0)),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        StreamBuilder<List<ActivitiesProgressRecord>>(
                                                                                                          stream: queryActivitiesProgressRecord(
                                                                                                            queryBuilder: (activitiesProgressRecord) => activitiesProgressRecord
                                                                                                                .where(
                                                                                                                  'user',
                                                                                                                  isEqualTo: listViewUsersRecord.reference,
                                                                                                                )
                                                                                                                .where(
                                                                                                                  'categRef',
                                                                                                                  isEqualTo: categsItem.reference,
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
                                                                                                            List<ActivitiesProgressRecord> containerActivitiesProgressRecordList = snapshot.data!;
                                                                                                            return Container(
                                                                                                              decoration: const BoxDecoration(),
                                                                                                              child: Builder(
                                                                                                                builder: (context) {
                                                                                                                  if (containerActivitiesProgressRecordList.isNotEmpty) {
                                                                                                                    return Container(
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      child: Container(
                                                                                                                        width: 100.0,
                                                                                                                        decoration: const BoxDecoration(),
                                                                                                                        child: wrapWithModel(
                                                                                                                          model: _model.quranupdateModels.getModel(
                                                                                                                            listViewUsersRecord.reference.id,
                                                                                                                            listViewIndex,
                                                                                                                          ),
                                                                                                                          updateCallback: () => setState(() {}),
                                                                                                                          child: QuranupdateWidget(
                                                                                                                            key: Key(
                                                                                                                              'Key536_${listViewUsersRecord.reference.id}',
                                                                                                                            ),
                                                                                                                            parameter1: containerActivitiesProgressRecordList.first.grade,
                                                                                                                            parameter3: containerActivitiesProgressRecordList.first.reference,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  } else {
                                                                                                                    return Container(
                                                                                                                      width: 100.0,
                                                                                                                      decoration: const BoxDecoration(),
                                                                                                                      child: wrapWithModel(
                                                                                                                        model: _model.quranCreateModels.getModel(
                                                                                                                          listViewUsersRecord.reference.id,
                                                                                                                          listViewIndex,
                                                                                                                        ),
                                                                                                                        updateCallback: () => setState(() {}),
                                                                                                                        child: QuranCreateWidget(
                                                                                                                          key: Key(
                                                                                                                            'Keyt3m_${listViewUsersRecord.reference.id}',
                                                                                                                          ),
                                                                                                                          parameter1: listViewUsersRecord.reference,
                                                                                                                          parameter2: categsItem.reference,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  }
                                                                                                                },
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(const SizedBox(width: 5.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                                          ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
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
