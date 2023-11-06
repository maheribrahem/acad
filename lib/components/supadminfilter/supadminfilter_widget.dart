import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'supadminfilter_model.dart';
export 'supadminfilter_model.dart';

class SupadminfilterWidget extends StatefulWidget {
  const SupadminfilterWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  _SupadminfilterWidgetState createState() => _SupadminfilterWidgetState();
}

class _SupadminfilterWidgetState extends State<SupadminfilterWidget> {
  late SupadminfilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupadminfilterModel());

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

    return Container();
  }
}
