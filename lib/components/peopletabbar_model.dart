import '/flutter_flow/flutter_flow_util.dart';
import '/pages/item_userlikesme/item_userlikesme_widget.dart';
import 'peopletabbar_widget.dart' show PeopletabbarWidget;
import 'package:flutter/material.dart';

class PeopletabbarModel extends FlutterFlowModel<PeopletabbarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for itemUserlikesme dynamic component.
  late FlutterFlowDynamicModels<ItemUserlikesmeModel> itemUserlikesmeModels;

  @override
  void initState(BuildContext context) {
    itemUserlikesmeModels =
        FlutterFlowDynamicModels(() => ItemUserlikesmeModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    itemUserlikesmeModels.dispose();
  }
}
