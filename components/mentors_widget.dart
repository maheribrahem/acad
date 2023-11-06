import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mentors_model.dart';
export 'mentors_model.dart';

class MentorsWidget extends StatefulWidget {
  const MentorsWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _MentorsWidgetState createState() => _MentorsWidgetState();
}

class _MentorsWidgetState extends State<MentorsWidget> {
  late MentorsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MentorsModel());

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.user!),
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
        final columnUsersRecord = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder<List<MentorsRecord>>(
              stream: queryMentorsRecord(
                limit: 10,
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
                List<MentorsRecord> dropDownMentorsRecordList = snapshot.data!;
                return FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(
                    _model.dropDownValue ??= columnUsersRecord.mentoor,
                  ),
                  options: dropDownMentorsRecordList
                      .map((e) => e.mentoremail)
                      .toList(),
                  optionLabels: dropDownMentorsRecordList
                      .map((e) => e.mentorname)
                      .toList(),
                  onChanged: (val) async {
                    setState(() => _model.dropDownValue = val);
                    await widget.user!.update(createUsersRecordData(
                      mentoor: _model.dropDownValue,
                    ));
                  },
                  width: 100.0,
                  height: 45.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Cairo',
                        fontSize: 12.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'fabigh00' /* mentor */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isSearchable: false,
                  isMultiSelect: false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
