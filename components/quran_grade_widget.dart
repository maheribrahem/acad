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
import 'quran_grade_model.dart';
export 'quran_grade_model.dart';

class QuranGradeWidget extends StatefulWidget {
  const QuranGradeWidget({
    Key? key,
    required this.user,
    required this.categRef,
    required this.progressActivRef,
  }) : super(key: key);

  final DocumentReference? user;
  final DocumentReference? categRef;
  final DocumentReference? progressActivRef;

  @override
  _QuranGradeWidgetState createState() => _QuranGradeWidgetState();
}

class _QuranGradeWidgetState extends State<QuranGradeWidget> {
  late QuranGradeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuranGradeModel());

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

    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: StreamBuilder<ActivitiesProgressRecord>(
          stream:
              ActivitiesProgressRecord.getDocument(widget.progressActivRef!),
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
            final textFieldActivitiesProgressRecord = snapshot.data!;
            return TextFormField(
              controller: _model.textController ??= TextEditingController(
                text: textFieldActivitiesProgressRecord.grade.toString(),
              ),
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                Duration(milliseconds: 1000),
                () async {
                  await widget.progressActivRef!
                      .update(createActivitiesProgressRecordData(
                    grade: double.tryParse(_model.textController.text),
                    when: getCurrentTimestamp,
                  ));
                },
              ),
              obscureText: false,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  'aj7xh27z' /* الدرجة... */,
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
              keyboardType: TextInputType.number,
              validator: _model.textControllerValidator.asValidator(context),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
            );
          },
        ),
      ),
    );
  }
}
