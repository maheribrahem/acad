import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categ_switcher_model.dart';
export 'categ_switcher_model.dart';

class CategSwitcherWidget extends StatefulWidget {
  const CategSwitcherWidget({
    Key? key,
    this.hide,
  }) : super(key: key);

  final bool? hide;

  @override
  _CategSwitcherWidgetState createState() => _CategSwitcherWidgetState();
}

class _CategSwitcherWidgetState extends State<CategSwitcherWidget> {
  late CategSwitcherModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategSwitcherModel());

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

    return Switch.adaptive(
      value: _model.switchValue ??= true,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue!);
      },
      activeColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: FlutterFlowTheme.of(context).accent1,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
