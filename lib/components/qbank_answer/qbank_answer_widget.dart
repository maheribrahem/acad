import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'qbank_answer_model.dart';
export 'qbank_answer_model.dart';

class QbankAnswerWidget extends StatefulWidget {
  const QbankAnswerWidget({
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
  _QbankAnswerWidgetState createState() => _QbankAnswerWidgetState();
}

class _QbankAnswerWidgetState extends State<QbankAnswerWidget> {
  late QbankAnswerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QbankAnswerModel());

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

    return FutureBuilder<List<QbankAttemptsRow>>(
      future: QbankAttemptsTable().queryRows(
        queryFn: (q) => q
            .eq(
              'usersID',
              currentUserReference?.id,
            )
            .eq(
              'QbankID',
              widget.qBankRef?.id,
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
        List<QbankAttemptsRow> containerQbankAttemptsRowList = snapshot.data!;
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
                    if (containerQbankAttemptsRowList.isNotEmpty) {
                      await QbankAttemptsTable().update(
                        data: {
                          'QbankAnswer': _model.choiceChipsValue,
                          'isTrue': containerQbankRecord.answer ==
                                  _model.choiceChipsValue
                              ? true
                              : false,
                        },
                        matchingRows: (rows) => rows.eq(
                          'ID',
                          containerQbankAttemptsRowList.first.id,
                        ),
                      );
                    } else {
                      await QbankAttemptsTable().insert({
                        'QbankActivitID': widget.activiRef?.id,
                        'QbankID': widget.qBankRef?.id,
                        'QbankAnswer': _model.choiceChipsValue,
                        'usersID': currentUserReference?.id,
                        'isTrue': containerQbankRecord.answer ==
                                _model.choiceChipsValue
                            ? true
                            : false,
                        'ID':
                            '${getCurrentTimestamp.secondsSinceEpoch.toString()}${random_data.randomString(
                          9,
                          16,
                          true,
                          true,
                          true,
                        )}',
                      });
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
                      containerQbankAttemptsRowList.isNotEmpty
                          ? containerQbankAttemptsRowList.first.qbankAnswer!
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
