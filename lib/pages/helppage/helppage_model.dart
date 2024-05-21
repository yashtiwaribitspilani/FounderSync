import '/flutter_flow/flutter_flow_util.dart';
import 'helppage_widget.dart' show HelppageWidget;
import 'package:flutter/material.dart';

class HelppageModel extends FlutterFlowModel<HelppageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
