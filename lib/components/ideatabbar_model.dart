import '/flutter_flow/flutter_flow_util.dart';
import 'ideatabbar_widget.dart' show IdeatabbarWidget;
import 'package:flutter/material.dart';

class IdeatabbarModel extends FlutterFlowModel<IdeatabbarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
