import '/flutter_flow/flutter_flow_util.dart';
import 'newhcat_widget.dart' show NewhcatWidget;
import 'package:flutter/material.dart';

class NewhcatModel extends FlutterFlowModel<NewhcatWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
