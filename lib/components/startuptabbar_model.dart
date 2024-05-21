import '/flutter_flow/flutter_flow_util.dart';
import 'startuptabbar_widget.dart' show StartuptabbarWidget;
import 'package:flutter/material.dart';

class StartuptabbarModel extends FlutterFlowModel<StartuptabbarWidget> {
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
