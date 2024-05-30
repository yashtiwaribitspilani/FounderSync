import '/components/userprofile_linked_in_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'linked_ineditable_tabbar_widget.dart' show LinkedIneditableTabbarWidget;
import 'package:flutter/material.dart';

class LinkedIneditableTabbarModel
    extends FlutterFlowModel<LinkedIneditableTabbarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for userprofileLinkedInPage component.
  late UserprofileLinkedInPageModel userprofileLinkedInPageModel;

  @override
  void initState(BuildContext context) {
    userprofileLinkedInPageModel =
        createModel(context, () => UserprofileLinkedInPageModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userprofileLinkedInPageModel.dispose();
  }
}
