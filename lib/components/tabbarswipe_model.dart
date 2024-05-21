import '/flutter_flow/flutter_flow_util.dart';
import '/pages/userprofilestartuppageswipepage/userprofilestartuppageswipepage_widget.dart';
import 'tabbarswipe_widget.dart' show TabbarswipeWidget;
import 'package:flutter/material.dart';

class TabbarswipeModel extends FlutterFlowModel<TabbarswipeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // Model for userprofilestartuppageswipepage component.
  late UserprofilestartuppageswipepageModel
      userprofilestartuppageswipepageModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  @override
  void initState(BuildContext context) {
    userprofilestartuppageswipepageModel =
        createModel(context, () => UserprofilestartuppageswipepageModel());
  }

  @override
  void dispose() {
    tabBarController1?.dispose();
    userprofilestartuppageswipepageModel.dispose();
    tabBarController2?.dispose();
  }
}
