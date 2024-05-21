import '/components/timelineend_widget.dart';
import '/components/timelinestart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'ideadisplaypage_widget.dart' show IdeadisplaypageWidget;
import 'package:flutter/material.dart';

class IdeadisplaypageModel extends FlutterFlowModel<IdeadisplaypageWidget> {
  ///  Local state fields for this page.

  bool statechange = false;

  bool statechangerequest = false;

  bool isfollowing = false;

  bool isliked = false;

  bool isdisliked = false;

  double averageratingpagestate = 0.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // Model for timelinestart component.
  late TimelinestartModel timelinestartModel1;
  // Model for timelineend component.
  late TimelineendModel timelineendModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // Model for timelinestart component.
  late TimelinestartModel timelinestartModel2;
  // Model for timelineend component.
  late TimelineendModel timelineendModel2;
  // State field(s) for teamup widget.
  FormFieldController<List<String>>? teamupValueController;
  String? get teamupValue => teamupValueController?.value?.firstOrNull;
  set teamupValue(String? val) =>
      teamupValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    timelinestartModel1 = createModel(context, () => TimelinestartModel());
    timelineendModel1 = createModel(context, () => TimelineendModel());
    timelinestartModel2 = createModel(context, () => TimelinestartModel());
    timelineendModel2 = createModel(context, () => TimelineendModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController1?.dispose();
    timelinestartModel1.dispose();
    timelineendModel1.dispose();
    tabBarController2?.dispose();
    timelinestartModel2.dispose();
    timelineendModel2.dispose();
  }
}
