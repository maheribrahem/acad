import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'categ_ends_model.dart';
export 'categ_ends_model.dart';

class CategEndsWidget extends StatefulWidget {
  const CategEndsWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  _CategEndsWidgetState createState() => _CategEndsWidgetState();
}

class _CategEndsWidgetState extends State<CategEndsWidget> {
  late CategEndsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategEndsModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FlutterFlowTimer(
          initialTime: _model.timerMilliseconds,
          getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
            value,
            hours: false,
            milliSecond: false,
          ),
          controller: _model.timerController,
          updateStateInterval: const Duration(milliseconds: 1000),
          onChanged: (value, displayTime, shouldUpdate) {
            _model.timerMilliseconds = value;
            _model.timerValue = displayTime;
            if (shouldUpdate) setState(() {});
          },
          onEnded: () async {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'start',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
            await CategGradesTable().insert({
              'editedAt': supaSerialize<DateTime>(getCurrentTimestamp),
              'categID': widget.parameter1,
              'userREF': currentUserReference?.id,
              'UID': currentUserUid,
            });
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'done',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          },
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
      ],
    );
  }
}
