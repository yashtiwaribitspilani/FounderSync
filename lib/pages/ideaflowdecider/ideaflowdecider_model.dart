import '/flutter_flow/flutter_flow_util.dart';
import 'ideaflowdecider_widget.dart' show IdeaflowdeciderWidget;
import 'package:flutter/material.dart';

class IdeaflowdeciderModel extends FlutterFlowModel<IdeaflowdeciderWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
