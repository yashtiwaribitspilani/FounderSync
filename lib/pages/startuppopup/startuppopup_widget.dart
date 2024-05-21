import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'startuppopup_model.dart';
export 'startuppopup_model.dart';

class StartuppopupWidget extends StatefulWidget {
  const StartuppopupWidget({super.key});

  @override
  State<StartuppopupWidget> createState() => _StartuppopupWidgetState();
}

class _StartuppopupWidgetState extends State<StartuppopupWidget> {
  late StartuppopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartuppopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
