import '/components/timelineend_widget.dart';
import '/components/timelinestart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'idea_tab_swipe_widget.dart' show IdeaTabSwipeWidget;
import 'package:flutter/material.dart';

class IdeaTabSwipeModel extends FlutterFlowModel<IdeaTabSwipeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for timelinestart component.
  late TimelinestartModel timelinestartModel;
  // Model for timelineend component.
  late TimelineendModel timelineendModel;

  @override
  void initState(BuildContext context) {
    timelinestartModel = createModel(context, () => TimelinestartModel());
    timelineendModel = createModel(context, () => TimelineendModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    timelinestartModel.dispose();
    timelineendModel.dispose();
  }
}
