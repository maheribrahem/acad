import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'qbank_answer_copy_model.dart';
export 'qbank_answer_copy_model.dart';

class QbankAnswerCopyWidget extends StatefulWidget {
  const QbankAnswerCopyWidget({
    super.key,
    this.parameter1,
    required this.qBankRef,
    this.emptyAnswer,
    this.answer,
  });

  final List<String>? parameter1;
  final DocumentReference? qBankRef;
  final String? emptyAnswer;
  final String? answer;

  @override
  _QbankAnswerCopyWidgetState createState() => _QbankAnswerCopyWidgetState();
}

class _QbankAnswerCopyWidgetState extends State<QbankAnswerCopyWidget> {
  late QbankAnswerCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QbankAnswerCopyModel());

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
          child: StreamBuilder<QbankRecord>(
            stream: QbankRecord.getDocument(widget.qBankRef!),
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
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                  child: FlutterFlowChoiceChips(
                    options: widget.parameter1!
                        .map((label) => ChipData(label))
                        .toList(),
                    onChanged: currentUserEmail == currentUserEmail
                        ? null
                        : (val) => setState(
                            () => _model.choiceChipsValue = val?.first),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
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
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily: 'Cairo',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                      iconColor: FlutterFlowTheme.of(context).primaryText,
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
                ),
              );
            },
          ),
        );
      },
    );
  }
}
