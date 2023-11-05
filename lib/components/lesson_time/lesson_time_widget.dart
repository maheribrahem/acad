import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lesson_time_model.dart';
export 'lesson_time_model.dart';

class LessonTimeWidget extends StatefulWidget {
  const LessonTimeWidget({
    Key? key,
    required this.activiRef,
  }) : super(key: key);

  final DocumentReference? activiRef;

  @override
  _LessonTimeWidgetState createState() => _LessonTimeWidgetState();
}

class _LessonTimeWidgetState extends State<LessonTimeWidget> {
  late LessonTimeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonTimeModel());

    _model.textFieldFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: StreamBuilder<ActivitiesRecord>(
        stream: ActivitiesRecord.getDocument(widget.activiRef!),
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
          final textFieldActivitiesRecord = snapshot.data!;
          return TextFormField(
            controller: _model.textController ??= TextEditingController(
              text: textFieldActivitiesRecord.time,
            ),
            focusNode: _model.textFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              Duration(milliseconds: 1000),
              () async {
                await widget.activiRef!.update(createActivitiesRecordData(
                  time: _model.textController.text,
                ));
              },
            ),
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: FFLocalizations.of(context).getText(
                'b4gfg2x7' /* وقت الدرس بالدقائق */,
              ),
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintStyle: FlutterFlowTheme.of(context).labelMedium,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
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
            keyboardType: TextInputType.number,
            validator: _model.textControllerValidator.asValidator(context),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
          );
        },
      ),
    );
  }
}
