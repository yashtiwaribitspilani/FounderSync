import '/components/ideatabbar_widget.dart';
import '/components/nav_bar1_widget.dart';
import '/components/peopletabbar_widget.dart';
import '/components/startuptabbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'likes_widget.dart' show LikesWidget;
import 'package:flutter/material.dart';

class LikesModel extends FlutterFlowModel<LikesWidget> {
  ///  Local state fields for this page.

  bool state = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for peopletabbar component.
  late PeopletabbarModel peopletabbarModel;
  // Model for ideatabbar component.
  late IdeatabbarModel ideatabbarModel;
  // Model for startuptabbar component.
  late StartuptabbarModel startuptabbarModel;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    peopletabbarModel = createModel(context, () => PeopletabbarModel());
    ideatabbarModel = createModel(context, () => IdeatabbarModel());
    startuptabbarModel = createModel(context, () => StartuptabbarModel());
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    peopletabbarModel.dispose();
    ideatabbarModel.dispose();
    startuptabbarModel.dispose();
    navBar1Model.dispose();
  }
}
