import '/components/userprofilestartuppage_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editable_tabbar_widget.dart' show EditableTabbarWidget;
import 'package:flutter/material.dart';

class EditableTabbarModel extends FlutterFlowModel<EditableTabbarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for userprofilestartuppage component.
  late UserprofilestartuppageModel userprofilestartuppageModel;

  @override
  void initState(BuildContext context) {
    userprofilestartuppageModel =
        createModel(context, () => UserprofilestartuppageModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userprofilestartuppageModel.dispose();
  }
}
