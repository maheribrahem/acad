import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/nav0/nav0_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profilecom_model.dart';
export 'profilecom_model.dart';

class ProfilecomWidget extends StatefulWidget {
  const ProfilecomWidget({Key? key}) : super(key: key);

  @override
  _ProfilecomWidgetState createState() => _ProfilecomWidgetState();
}

class _ProfilecomWidgetState extends State<ProfilecomWidget>
    with TickerProviderStateMixin {
  late ProfilecomModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilecomModel());

    _model.fullnameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.fullname, ''));
    _model.fullnameFocusNode ??= FocusNode();

    _model.usernameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.usernameFocusNode ??= FocusNode();

    _model.governmentController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.state, ''));
    _model.governmentFocusNode ??= FocusNode();

    _model.cityController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.city, ''));
    _model.cityFocusNode ??= FocusNode();

    _model.phoneController ??= TextEditingController(text: currentPhoneNumber);
    _model.phoneFocusNode ??= FocusNode();

    _model.schoolnameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.pastStudy, ''));
    _model.schoolnameFocusNode ??= FocusNode();

    _model.jobController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.job, ''));
    _model.jobFocusNode ??= FocusNode();

    _model.referrerController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.referral, ''));
    _model.referrerFocusNode ??= FocusNode();

    _model.telegramController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.telegram, ''));
    _model.telegramFocusNode ??= FocusNode();

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
        title: 'profilecom',
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
                                        constraints: BoxConstraints(
                                          maxWidth: 700.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: double.infinity,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.00, -1.00),
                                                      child:
                                                          SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        700.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .shaaad,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              16.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              16.0),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Divider(
                                                                        height:
                                                                            8.0,
                                                                        thickness:
                                                                            4.0,
                                                                        indent:
                                                                            140.0,
                                                                        endIndent:
                                                                            140.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            16.0),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'v7hcxpo4' /* أكمل بياناتك الشخصية */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).headlineMedium,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Form(
                                                                                      key: _model.formKey,
                                                                                      autovalidateMode: AutovalidateMode.always,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.00, 0.00),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                              child: AuthUserStreamWidget(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    final selectedMedia = await selectMedia(
                                                                                                      maxWidth: 1000.00,
                                                                                                      maxHeight: 1000.00,
                                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                                      multiImage: false,
                                                                                                    );
                                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                      setState(() => _model.isDataUploading = true);
                                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                      var downloadUrls = <String>[];
                                                                                                      try {
                                                                                                        showUploadMessage(
                                                                                                          context,
                                                                                                          'Uploading file...',
                                                                                                          showLoading: true,
                                                                                                        );
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
                                                                                                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                        _model.isDataUploading = false;
                                                                                                      }
                                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                        setState(() {
                                                                                                          _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                                                                          _model.uploadedFileUrl = downloadUrls.first;
                                                                                                        });
                                                                                                        showUploadMessage(context, 'Success!');
                                                                                                      } else {
                                                                                                        setState(() {});
                                                                                                        showUploadMessage(context, 'Failed to upload data');
                                                                                                        return;
                                                                                                      }
                                                                                                    }
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 80.0,
                                                                                                    height: 80.0,
                                                                                                    clipBehavior: Clip.antiAlias,
                                                                                                    decoration: BoxDecoration(
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
                                                                                                    child: Image.network(
                                                                                                      valueOrDefault<String>(
                                                                                                        currentUserPhoto,
                                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dark-mode-chat-xk2sj6/assets/ails754ngloi/uiAvatar@2x.png',
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.fullnameController,
                                                                                                focusNode: _model.fullnameFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'qwpocsnv' /* Your full name */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'g9igp0cf' /* اسمك الرباعي كما في البطاقة ال... */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                validator: _model.fullnameControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.usernameController,
                                                                                                focusNode: _model.usernameFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    '0h3khrj0' /* اسمك كما تريد أن يظهر في الموق... */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'lvlk34et' /* اسمك كما سيعرض في الموقع */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                validator: _model.usernameControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                AuthUserStreamWidget(
                                                                                                  builder: (context) => FlutterFlowRadioButton(
                                                                                                    options: [
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'mgdoc3fd' /* ذكر */,
                                                                                                      ),
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '0e6axanz' /* أنثى */,
                                                                                                      )
                                                                                                    ].toList(),
                                                                                                    onChanged: (val) => setState(() {}),
                                                                                                    controller: _model.genderValueController ??= FormFieldController<String>(valueOrDefault(currentUserDocument?.gender, '')),
                                                                                                    optionHeight: 25.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Cairo',
                                                                                                          color: Colors.black,
                                                                                                        ),
                                                                                                    buttonPosition: RadioButtonPosition.left,
                                                                                                    direction: Axis.horizontal,
                                                                                                    radioButtonColor: Colors.blue,
                                                                                                    inactiveRadioButtonColor: Color(0x8A000000),
                                                                                                    toggleable: false,
                                                                                                    horizontalAlignment: WrapAlignment.start,
                                                                                                    verticalAlignment: WrapCrossAlignment.start,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      final _datePickedDate = await showDatePicker(
                                                                                                        context: context,
                                                                                                        initialDate: getCurrentTimestamp,
                                                                                                        firstDate: DateTime(1900),
                                                                                                        lastDate: DateTime(2050),
                                                                                                      );

                                                                                                      if (_datePickedDate != null) {
                                                                                                        safeSetState(() {
                                                                                                          _model.datePicked = DateTime(
                                                                                                            _datePickedDate.year,
                                                                                                            _datePickedDate.month,
                                                                                                            _datePickedDate.day,
                                                                                                          );
                                                                                                        });
                                                                                                      }
                                                                                                    },
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'kw1bh5zd' /* تاريخ ميلادك */,
                                                                                                    ),
                                                                                                    options: FFButtonOptions(
                                                                                                      width: 230.0,
                                                                                                      height: 60.0,
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Lexend Deca',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                      elevation: 3.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Colors.transparent,
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(40.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    _model.datePicked?.toString(),
                                                                                                    'your birthday',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.governmentController,
                                                                                                focusNode: _model.governmentFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    '7mh62afm' /* المحافظة */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    '9uupkenh' /* محافظتك */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                validator: _model.governmentControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.cityController,
                                                                                                focusNode: _model.cityFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'j1dw6028' /* المدينة */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    '855c5g7f' /* مدينتك */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                validator: _model.cityControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.phoneController,
                                                                                                focusNode: _model.phoneFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'rccgwnou' /* رقم الهاتف */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'bw30njfw' /* أدخل رقم هاتف صحيح لنتواصل معك */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                validator: _model.phoneControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: AuthUserStreamWidget(
                                                                                                    builder: (context) => FlutterFlowDropDown<String>(
                                                                                                      controller: _model.dropDownValueController ??= FormFieldController<String>(
                                                                                                        _model.dropDownValue ??= valueOrDefault(currentUserDocument?.schoolLevel, ''),
                                                                                                      ),
                                                                                                      options: [
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'ush8cpkq' /* المدرسة */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '5q8qcupu' /* الجامعة */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '9byc9fcs' /* الدراسات العليا */,
                                                                                                        )
                                                                                                      ],
                                                                                                      onChanged: (val) => setState(() => _model.dropDownValue = val),
                                                                                                      width: 180.0,
                                                                                                      height: 50.0,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'itd2nmyw' /* المرحلة التعليمية */,
                                                                                                      ),
                                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      elevation: 2.0,
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderWidth: 0.0,
                                                                                                      borderRadius: 0.0,
                                                                                                      margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                                      hidesUnderline: true,
                                                                                                      isSearchable: false,
                                                                                                      isMultiSelect: false,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.schoolnameController,
                                                                                                focusNode: _model.schoolnameFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'muvs7cih' /* مدرستك/جامعتك */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'xiugu2x2' /* اسم المدرسة أو الجامعة */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                validator: _model.schoolnameControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.jobController,
                                                                                                focusNode: _model.jobFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'ix8oqo54' /* الوظيفة */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'lmoflppu' /* لا أعمل  إن كنت لا تعمل */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                validator: _model.jobControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                AuthUserStreamWidget(
                                                                                                  builder: (context) => FlutterFlowRadioButton(
                                                                                                    options: [
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '8woqghds' /* أعزب */,
                                                                                                      ),
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'hnuqmn0j' /* متزوج */,
                                                                                                      )
                                                                                                    ].toList(),
                                                                                                    onChanged: (val) => setState(() {}),
                                                                                                    controller: _model.socialstatusValueController ??= FormFieldController<String>(valueOrDefault(currentUserDocument?.socialStatus, '')),
                                                                                                    optionHeight: 25.0,
                                                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Cairo',
                                                                                                          color: Colors.black,
                                                                                                        ),
                                                                                                    buttonPosition: RadioButtonPosition.left,
                                                                                                    direction: Axis.horizontal,
                                                                                                    radioButtonColor: Colors.blue,
                                                                                                    inactiveRadioButtonColor: Color(0x8A000000),
                                                                                                    toggleable: false,
                                                                                                    horizontalAlignment: WrapAlignment.start,
                                                                                                    verticalAlignment: WrapCrossAlignment.start,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: AuthUserStreamWidget(
                                                                                                    builder: (context) => FlutterFlowDropDown<String>(
                                                                                                      controller: _model.quranValueController ??= FormFieldController<String>(
                                                                                                        _model.quranValue ??= valueOrDefault(currentUserDocument?.quranJuz, ''),
                                                                                                      ),
                                                                                                      options: [
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'vfo3cgq4' /* 0 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '17mwuvxt' /* 1 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'at8227ae' /* 2 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '80avjnss' /* 3 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'tsi7qspv' /* 4 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'fted8xym' /* 5 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'aauhervs' /* 6 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '1vi12prh' /* 7 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '4gjkedkw' /* 8 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'r2d78vuj' /* 9 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '0q8pe8km' /* 10 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '9gldkvby' /* 11 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'nwjeyr4a' /* 12 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '78g85my0' /* 13 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'tcps35ir' /* 14 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '9cfown2c' /* 15 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'em1h6zm1' /* 16 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '36x5jdj8' /* 17 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '6slhx129' /* 18 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'a2eg1q96' /* 19 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'll6y4c0z' /* 20 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'sfgchhv1' /* 21 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'j1f886wk' /* 22 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'grqiog00' /* 23 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'nmx9fneo' /* 24 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'cmy9ub2s' /* 25 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'a2lxbrtg' /* 26 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          '86tmczda' /* 27 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'erf4oimq' /* 28 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'd8mdxpju' /* 29 */,
                                                                                                        ),
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'irgmas7s' /* 30 */,
                                                                                                        )
                                                                                                      ],
                                                                                                      onChanged: (val) => setState(() => _model.quranValue = val),
                                                                                                      width: 274.0,
                                                                                                      height: 50.0,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'r9sect5y' /* ما تستحضره من القرآن */,
                                                                                                      ),
                                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      elevation: 2.0,
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderWidth: 0.0,
                                                                                                      borderRadius: 0.0,
                                                                                                      margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                                      hidesUnderline: true,
                                                                                                      isSearchable: false,
                                                                                                      isMultiSelect: false,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.referrerController,
                                                                                                focusNode: _model.referrerFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    '1stytt58' /* من رشحك */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'ubpomo3j' /* من رشحك للأكاديمية */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                validator: _model.referrerControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                            child: AuthUserStreamWidget(
                                                                                              builder: (context) => TextFormField(
                                                                                                controller: _model.telegramController,
                                                                                                focusNode: _model.telegramFocusNode,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                                    'mfilvl2g' /* معرف التليجرام */,
                                                                                                  ),
                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    '814qvihe' /* أدخل معرف التليجرام الخاص بك */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                                                keyboardType: TextInputType.emailAddress,
                                                                                                validator: _model.telegramControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                                  displayName: _model.usernameController.text,
                                                                                                  photoUrl: _model.uploadedFileUrl,
                                                                                                  phoneNumber: _model.phoneController.text,
                                                                                                  born: _model.datePicked,
                                                                                                  gender: _model.genderValue,
                                                                                                  fullname: _model.fullnameController.text,
                                                                                                  state: _model.governmentController.text,
                                                                                                  city: _model.cityController.text,
                                                                                                  schoolLevel: _model.dropDownValue,
                                                                                                  job: _model.socialstatusValue,
                                                                                                  socialStatus: _model.socialstatusValue,
                                                                                                  quranJuz: _model.quranValue,
                                                                                                  referral: _model.referrerController.text,
                                                                                                  createdTime: getCurrentTimestamp,
                                                                                                  pastStudy: _model.schoolnameController.text,
                                                                                                  telegram: _model.telegramController.text,
                                                                                                ));

                                                                                                context.pushNamed('profile');
                                                                                              },
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                '9c43t7fd' /* حفظ */,
                                                                                              ),
                                                                                              options: FFButtonOptions(
                                                                                                width: 230.0,
                                                                                                height: 60.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Lexend Deca',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      fontSize: 16.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                                elevation: 3.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
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
