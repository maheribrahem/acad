import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/qoptions/qoptions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qand_a_model.dart';
export 'qand_a_model.dart';

class QandAWidget extends StatefulWidget {
  const QandAWidget({
    Key? key,
    this.parameter1,
    required this.qbankDoc,
  }) : super(key: key);

  final DocumentReference? parameter1;
  final QbankRecord? qbankDoc;

  @override
  _QandAWidgetState createState() => _QandAWidgetState();
}

class _QandAWidgetState extends State<QandAWidget> {
  late QandAModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QandAModel());

    _model.textController1 ??=
        TextEditingController(text: widget.qbankDoc?.order?.toString());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.qbankDoc?.qtext);
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<QbankRecord>(
      stream: QbankRecord.getDocument(widget.parameter1!),
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
        final containerQbankRecord = snapshot.data!;
        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController1',
                          Duration(milliseconds: 2000),
                          () async {
                            await widget.qbankDoc!.reference
                                .update(createQbankRecordData(
                              order: int.tryParse(_model.textController1.text),
                            ));
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'order updated',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          },
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'js2raet2' /* الترتيب */,
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
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController2',
                          Duration(milliseconds: 2000),
                          () async {
                            await widget.qbankDoc!.reference
                                .update(createQbankRecordData(
                              qtext: _model.textController2.text,
                            ));
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Qtext updated',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          },
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            '5c93crrz' /* نص السؤال */,
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
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await widget.qbankDoc!.reference.delete();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Q deleted',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).warning,
                            ),
                          );
                        },
                        child: Icon(
                          Icons.delete_forever_rounded,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 40.0,
                        ),
                      ),
                    ].divide(SizedBox(height: 5.0)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await widget.qbankDoc!.reference.update({
                      ...mapToFirestore(
                        {
                          'options': FieldValue.arrayUnion(['']),
                        },
                      ),
                    });
                  },
                  text: '',
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  final options = widget.qbankDoc?.options?.toList() ?? [];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(options.length, (optionsIndex) {
                      final optionsItem = options[optionsIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200.0,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.qoptionsModels.getModel(
                                optionsIndex.toString(),
                                optionsIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: QoptionsWidget(
                                key: Key(
                                  'Keyinq_${optionsIndex.toString()}',
                                ),
                                options:
                                    containerQbankRecord.options[optionsIndex],
                                index: optionsIndex,
                                qRef: widget.parameter1!,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await widget.parameter1!
                                      .update(createQbankRecordData(
                                    answer: optionsItem,
                                  ));
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'answer updated',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.checkDouble,
                                  color: optionsItem ==
                                          containerQbankRecord.answer
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).alternate,
                                  size: 30.0,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await widget.parameter1!.update({
                                    ...mapToFirestore(
                                      {
                                        'options': FieldValue.arrayRemove(
                                            [optionsItem]),
                                      },
                                    ),
                                  });
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'deleted',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).warning,
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.delete_forever_rounded,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 30.0,
                                ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ]
                            .divide(SizedBox(width: 5.0))
                            .around(SizedBox(width: 5.0)),
                      );
                    }).divide(SizedBox(height: 10.0)),
                  );
                },
              ),
              Text(
                containerQbankRecord.answer,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ].divide(SizedBox(height: 5.0)),
          ),
        );
      },
    );
  }
}
