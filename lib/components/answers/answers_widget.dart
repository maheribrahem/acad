import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'answers_model.dart';
export 'answers_model.dart';

class AnswersWidget extends StatefulWidget {
  const AnswersWidget({
    super.key,
    required this.order,
  });

  final int? order;

  @override
  _AnswersWidgetState createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  late AnswersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnswersModel());

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

    return StreamBuilder<List<TestsRecord>>(
      stream: queryTestsRecord(
        queryBuilder: (testsRecord) => testsRecord.where(
          'Qorder',
          isEqualTo: widget.order,
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
        List<TestsRecord> dropDownTestsRecordList = snapshot.data!;
        return FlutterFlowDropDown<bool>(
          controller: _model.dropDownValueController ??=
              FormFieldController<bool>(
            _model.dropDownValue ??= false,
          ),
          options: List<bool>.from(
              dropDownTestsRecordList.map((e) => e.isTrue).toList()),
          optionLabels: dropDownTestsRecordList.map((e) => e.answer).toList(),
          onChanged: (val) => setState(() => _model.dropDownValue = val),
          width: 300.0,
          height: 50.0,
          textStyle: FlutterFlowTheme.of(context).bodyMedium,
          hintText: FFLocalizations.of(context).getText(
            'vdn8r623' /* اختر الإجابة الصيحة */,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          elevation: 10.0,
          borderColor: FlutterFlowTheme.of(context).secondaryText,
          borderWidth: 2.0,
          borderRadius: 8.0,
          margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
          hidesUnderline: true,
          isSearchable: false,
          isMultiSelect: false,
        );
      },
    );
  }
}
