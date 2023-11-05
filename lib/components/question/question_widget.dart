import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_model.dart';
export 'question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final DocumentReference? questions;

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late QuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionModel());

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

    return StreamBuilder<QuestionRecord>(
      stream: QuestionRecord.getDocument(widget.questions!),
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
        final containerQuestionRecord = snapshot.data!;
        return Material(
          color: Colors.transparent,
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '${containerQuestionRecord.order.toString()} - ${containerQuestionRecord.question}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Cairo',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<AnswersRecord>>(
                        stream: queryAnswersRecord(
                          queryBuilder: (answersRecord) => answersRecord.where(
                            'questionID',
                            isEqualTo: widget.questions,
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
                          List<AnswersRecord> radioButtonAnswersRecordList =
                              snapshot.data!;
                          return FlutterFlowRadioButton(
                            options: radioButtonAnswersRecordList
                                .map((e) => e.answer)
                                .toList()
                                .toList(),
                            onChanged: (val) => setState(() {}),
                            controller: _model.radioButtonValueController ??=
                                FormFieldController<String>(null),
                            optionHeight: 32.0,
                            textStyle: FlutterFlowTheme.of(context).labelMedium,
                            selectedTextStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                            buttonPosition: RadioButtonPosition.left,
                            direction: Axis.vertical,
                            radioButtonColor:
                                FlutterFlowTheme.of(context).primary,
                            inactiveRadioButtonColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            toggleable: true,
                            horizontalAlignment: WrapAlignment.start,
                            verticalAlignment: WrapCrossAlignment.start,
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
    );
  }
}
