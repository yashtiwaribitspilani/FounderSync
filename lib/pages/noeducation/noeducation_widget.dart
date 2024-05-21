import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'noeducation_model.dart';
export 'noeducation_model.dart';

class NoeducationWidget extends StatefulWidget {
  const NoeducationWidget({super.key});

  @override
  State<NoeducationWidget> createState() => _NoeducationWidgetState();
}

class _NoeducationWidgetState extends State<NoeducationWidget> {
  late NoeducationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoeducationModel());

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
          'No Education Added',
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
