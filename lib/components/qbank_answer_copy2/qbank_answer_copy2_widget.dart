import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'qbank_answer_copy2_model.dart';
export 'qbank_answer_copy2_model.dart';

class QbankAnswerCopy2Widget extends StatefulWidget {
  const QbankAnswerCopy2Widget({
    super.key,
    this.parameter1,
    required this.qBankRef,
    this.emptyAnswer,
    this.answer,
    required this.activiRef,
  });

  final List<String>? parameter1;
  final DocumentReference? qBankRef;
  final String? emptyAnswer;
  final String? answer;
  final DocumentReference? activiRef;

  @override
  _QbankAnswerCopy2WidgetState createState() => _QbankAnswerCopy2WidgetState();
}

class _QbankAnswerCopy2WidgetState extends State<QbankAnswerCopy2Widget> {
  late QbankAnswerCopy2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QbankAnswerCopy2Model());

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

    return StreamBuilder<List<QbankAttemptsRecord>>(
      stream: queryQbankAttemptsRecord(
        queryBuilder: (qbankAttemptsRecord) => qbankAttemptsRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'QbankRef',
              isEqualTo: widget.qBankRef,
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
        List<QbankAttemptsRecord> containerQbankAttemptsRecordList =
            snapshot.data!;
        return Container(
          decoration: const BoxDecoration(),
          child: StreamBuilder<QbankRecord>(
            stream: QbankRecord.getDocument(widget.qBankRef!),
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
              final containerQbankRecord = snapshot.data!;
              return Container(
                decoration: const BoxDecoration(),
                child: FlutterFlowChoiceChips(
                  options: widget.parameter1!
                      .map((label) => ChipData(label))
                      .toList(),
                  onChanged: (val) async {
                    setState(() => _model.choiceChipsValue = val?.first);
                    if (containerQbankAttemptsRecordList.isNotEmpty) {
                      await containerQbankAttemptsRecordList.first.reference
                          .delete();
                      if (containerQbankAttemptsRecordList.isNotEmpty) {
                        await containerQbankAttemptsRecordList.first.reference
                            .delete();

                        await QbankAttemptsRecord.collection
                            .doc()
                            .set(createQbankAttemptsRecordData(
                              user: currentUserReference,
                              qbankAnswer: _model.choiceChipsValue,
                              qbankRef: widget.qBankRef,
                              isTrue: containerQbankRecord.answer ==
                                  _model.choiceChipsValue,
                              qbankActivitRef: widget.activiRef,
                            ));
                      } else {
                        await QbankAttemptsRecord.collection
                            .doc()
                            .set(createQbankAttemptsRecordData(
                              user: currentUserReference,
                              qbankAnswer: _model.choiceChipsValue,
                              qbankRef: widget.qBankRef,
                              isTrue: containerQbankRecord.answer ==
                                  _model.choiceChipsValue,
                              qbankActivitRef: widget.activiRef,
                            ));
                      }
                    } else {
                      await QbankAttemptsRecord.collection
                          .doc()
                          .set(createQbankAttemptsRecordData(
                            user: currentUserReference,
                            qbankAnswer: _model.choiceChipsValue,
                            qbankRef: widget.qBankRef,
                            isTrue: containerQbankRecord.answer ==
                                _model.choiceChipsValue,
                            qbankActivitRef: widget.activiRef,
                          ));
                    }
                  },
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 18.0,
                    elevation: 4.0,
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: const Color(0x00000000),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    [
                      containerQbankAttemptsRecordList.isNotEmpty
                          ? containerQbankAttemptsRecordList.first.qbankAnswer
                          : ''
                    ],
                  ),
                  wrapped: true,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
