import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'options_model.dart';
export 'options_model.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({
    Key? key,
    required this.questionIs,
  }) : super(key: key);

  final String? questionIs;

  @override
  _OptionsWidgetState createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  late OptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionsModel());

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
        queryBuilder: (testsRecord) => testsRecord
            .where(
              'question',
              isEqualTo: widget.questionIs,
            )
            .orderBy('Aorder'),
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
        List<TestsRecord> radioButtonTestsRecordList = snapshot.data!;
        return FlutterFlowRadioButton(
          options:
              radioButtonTestsRecordList.map((e) => e.answer).toList().toList(),
          onChanged: (val) => setState(() {}),
          controller: _model.radioButtonValueController ??=
              FormFieldController<String>(null),
          optionHeight: 32.0,
          textStyle: FlutterFlowTheme.of(context).labelMedium,
          selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium,
          buttonPosition: RadioButtonPosition.left,
          direction: Axis.vertical,
          radioButtonColor: FlutterFlowTheme.of(context).primary,
          inactiveRadioButtonColor: FlutterFlowTheme.of(context).secondaryText,
          toggleable: false,
          horizontalAlignment: WrapAlignment.start,
          verticalAlignment: WrapCrossAlignment.start,
        );
      },
    );
  }
}
