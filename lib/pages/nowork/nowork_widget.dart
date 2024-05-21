import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nowork_model.dart';
export 'nowork_model.dart';

class NoworkWidget extends StatefulWidget {
  const NoworkWidget({super.key});

  @override
  State<NoworkWidget> createState() => _NoworkWidgetState();
}

class _NoworkWidgetState extends State<NoworkWidget> {
  late NoworkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoworkModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Work Experience Added',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primary,
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
